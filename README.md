# MLB Rest-of-Season Win Projections — 2026

## Overview

This project is an MLB rest-of-season win projection system, built as a portfolio piece to showcase SQL and Tableau skills. It combines a Postgres backend, a Python data pipeline, and a Monte Carlo simulation engine to produce daily-updated win projections, playoff probabilities, and matchup forecasts for all 30 teams, presented through a public Tableau dashboard.

**[Live Dashboard](https://public.tableau.com/views/mlb-predictions/HomePage?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

The system pulls daily game data from the MLB Stats API, blends preseason expectations with in-season performance using a shrinkage-weighted strength estimate, and simulates the remainder of the season 15,000 times per day to generate a full distribution of possible outcomes for every team.

This is an independent, unofficial project and is not affiliated with, endorsed by, or connected to Major League Baseball, its teams, or any MLB entity in any way. All team names and data are used solely for informational and educational purposes.

---

## Methodology

The final wins projection works on a series of mathematical processes, with the input data updated on a daily basis.

### Weighted Strength

```
Weighted Strength = (1 - α) × P_pre + α × P_pyt
```

Every day, a strength estimate is calculated for each team as a blend of two components:

**Preseason Estimate (P_pre)** — Taken from preseason over/under lines for total wins from a Vegas sportsbook. Each line is divided by 162 to express it as a win percentage.

**Pythagenpat (P_pyt)**:

```
P_pyt = RS^x / (RS^x + RA^x)

where x = ((RS + RA) / GP) ^ 0.287
```

This is currently accepted as the most accurate alteration to the original run-differential-based Pythagorean expectation formula for MLB. Its main strength comes from setting the exponent to also be a function of run differential, rather than using a fixed exponent.

**Alpha (α)**:

```
α = GP / (GP + k)
```

This shifts the weight between the preseason estimate and in-season Pythagenpat over time. It allows the model to stay relatively resistant to early-season variance (when GP is small, α is small, so the preseason estimate dominates) while converging toward in-season performance as the season progresses (as GP grows, α approaches 1). Through backtesting (see below), **k = 120** was selected as the value used in production.

### Matchup Probability

Once we have the weighted strength for each team, another series of equations lets us compare two teams facing each other:

**Log5** — Using the home team as reference, this gives the home team's win probability as a function of both teams' weighted strengths (S_home, S_away):

```
P(Home Wins) = (S_home - S_home × S_away) / (S_home + S_away - 2 × S_home × S_away)
```

**Home Field Advantage (HFA)** — We add 0.025 to the Log5 output to account for home field advantage, clipped to the range [0.05, 0.95]:

```
P_final = clip(P(Home Wins) + 0.025, min=0.05, max=0.95)
```

This HFA adjustment is currently blind to a team's actual observed home/away performance — see Known Limitations.

**Choosing a Winner** — Once we have the final probability, we draw a random number from a Uniform(0, 1) distribution. The home team wins if the drawn number is ≤ P_final.

### Monte Carlo Simulation

With all of these functions set, we apply them in a Monte Carlo simulation loop. For each day's simulation run, we first pull the necessary information from the database: each team's weighted strength, current win total, and the entire remaining schedule. We then go through the remaining schedule game by game, calculating P_final for that matchup and choosing a winner via the process above. The winning team's simulated win total (initialized from their actual current wins) is incremented by one. Once every remaining game has been simulated, each team's final projected win total for that run is recorded.

This entire process is repeated 15,000 times, producing a full distribution of possible final win totals for each team. Our projection for that day is the mean of this distribution.

---

## Backtesting & Parameter Selection

Initial values (k=40, hfa_beta=0.025) were chosen based on general reading about Pythagenpat stability and HFA trends, before any project-specific backtesting was done.

**Optimizing k via linear backtest**

Early on, a quick linear backtest was run using the 2019 and 2021–2025 seasons to optimize k independently. This backtest approximated the simulation process without actually simulating games: for every (season, team, games played) combination, it linearly projected a final win total as

```
Projected Wins = Current Wins + (Remaining Games × Weighted Strength)
```

The squared error against that team's actual final win total was calculated and summed across all teams/seasons into a single MSE value. This was repeated for k = 10, 20, ..., 160, and MSE was lowest between k=110 and k=130. A more granular sweep across that narrower range converged on **k=120**.

**Joint optimization via simulation sweep**

Once the full simulation engine was working, a modified version was built to jointly test k and hfa_beta together. Since actually running simulations is far more computationally expensive than the linear approximation above, this test used a sample of 36 dates (roughly one per month per season) rather than every date, and reduced sims per date to 3,000 (other testing showed little variance in mean projected wins between 3,000 and 15,000 sims). A double loop swept through 25 (k, beta) pairs.

The result was inconclusive: there was no clear trend in MSE across the (k, beta) grid. The general pattern still supported k≈120, but beta's effect on MSE varied without a consistent direction across pairs. The single lowest-MSE pair was k=110, beta=0.3, but the difference from neighboring pairs was small, and the surrounding grid gave no indication this was a genuine minimum rather than noise. Given this, the original values (k=120, hfa_beta=0.025) were kept rather than changed based on an unstable result.

**Takeaway:** the aggregate MSE metric used here appears too coarse to detect a real per-game HFA effect, if one exists. Refining HFA further (e.g., estimating it per team rather than league-wide) was considered out of scope for this pass — see Known Limitations.

---

## Architecture

**Database — Neon Postgres**

The core schema consists of: `teams`, `preseason_estimates`, `schedule`, `daily_team_strength`, `model_config`, `simulation_batches`, and `daily_win_distribution`. `teams.team_id` uses MLB's own team IDs directly (not a sequential surrogate key), which simplifies joins against data pulled from the MLB Stats API.

`model_config`, `daily_team_strength`, and `simulation_batches` all follow a "recompute-in-place" philosophy rather than maintaining versioned history — the pipeline always resolves to the most-recent row for a given config or strength value, and a full historical recompute is expected (and accepted) whenever a parameter changes. `simulation_batches` allows multiple batches per day; the canonical batch is whichever has the latest `created_at`.

**Pipeline — Python + GitHub Actions**

The daily pipeline (`src/data_pipeline/`, `src/simulation/`) runs as a chained sequence: fetch new game/schedule data → recalculate strength → run the Monte Carlo simulation → export results. This is automated via a GitHub Actions workflow (`.github/workflows/daily_update.yml`) that runs once daily at 10:00 UTC — timed early in the day to improve the odds that Tableau Public's once-daily Google Sheets pull reflects the new data with minimal lag — with a final step that generates CSV exports and commits/pushes them back to the repository under a bot identity.

Data comes from the MLB Stats API (`statsapi.mlb.com`), which requires handling several real-world quirks: doubleheaders (unique `gamePk` per game), suspended/resumed games (which can carry a backdated `officialDate`), postponements, and transitional game statuses like `Completed Early` vs `Game Complete`.

**Exports (`src/exports/` → `exports/*.csv`)**

Several export scripts produce the CSVs that ultimately feed Tableau:
- `export_strengths`, `export_matchups`, `export_wins` — run daily as part of the automated pipeline.
- `export_pmf_summary` — daily; produces small, Sheets-friendly percentile summaries (mean, p10/p25/p75/p90) per team/date.
- `export_pmfs` — full simulation history per team/date/win-total; too large for Google Sheets' `IMPORTDATA` limit, currently delivered via manual upload (see Known Limitations).
- `export_preseason_data`, `export_teams` — manual/one-time exports, not part of the daily cycle.

An orchestration script, `daily_export.py`, runs the four daily-recurring exports together.

**Delivery chain**

CSVs are committed to the public GitHub repo → pulled into Google Sheets via `IMPORTDATA` against the raw GitHub URLs → Tableau Public syncs from those Sheets roughly once per day, at a time Tableau controls rather than the pipeline (see Known Limitations for the resulting lag). Full PMF history bypasses this chain entirely and is uploaded to Tableau manually as a separate, blended data source.

**Tableau**

The published workbook consists of four pages — Home, Team Detail (parameterized by a team-selector parameter rather than 30 separate pages), Multi-Team Comparison, and Head-to-Head — connected by a shared navigation bar. Team-level color coding uses a custom palette (`MLB Team Primary`/`Secondary`) built from official team hex codes and installed via a Tableau preferences file, applied consistently wherever team identity needs visual differentiation.

---

## Known Limitations

**Methodology** — Although our backtest showed that a static hfa_beta value doesn't produce any clear trend, it would still be more technically solid to look at each team's observed HFA, since it can vary pretty drastically team-to-team. Similarly, I've noticed that the current weight structure with k is a bit flawed. With a modified linear backtest, I was able to see that the optimal value of k shrank when only considering games played later in the season. This means our weight formula isn't capturing convergence toward in-season data as well as it could, especially once past the very early season. This makes sense, since k was originally optimized over full seasons' worth of data, so the observed MSE per k value is skewed by the high variance of the early season.

**Connections and Exports** — The majority of the data exported to Tableau works via the pipeline outlined in another section. However, the full PMFs are too large for `=IMPORTDATA` in Google Sheets, and currently have to be updated manually. I've deferred a direct connection via the Google Sheets API to avoid adding authentication and credential management to the pipeline for a single delivery step. Regardless, the primary issue with building a fully automated daily pipeline is Tableau Public's data refresh limitations. There's no way to guarantee Tableau will pull new data in a timely manner, so for now we have to live with up to a day of lag between the pipeline running and the dashboard reflecting it. Starting the pipeline at 10:00 UTC is an attempt at overcoming this by giving Tableau's daily refresh window a better chance of landing after the new data is available, but it isn't guaranteed to work every day.

**Tableau** — Because of the nature of the data shown, Tableau requires a multi-layered relationship structure between the different exported tables, which sometimes led to minor errors if not done correctly. For example, I ran into a small handful of cases where specific teams' values were duplicating under `SUM` aggregation; the root cause was never conclusively identified, though switching to `AVG()` as the default aggregate function resolved it in practice. Additionally, there are general limitations with Tableau Public around full customization — for instance, coloring multiple lines within a single chart both dynamically (by team) and independently (by dash/style) isn't natively supported the way it would be in a more code-driven visualization tool. These aren't things Tableau was built to do, but they're limitations worth noting regardless.

---

## Future Work

- **Per-team HFA** — Move from a flat league-wide HFA constant to a shrinkage-based, per-team estimate (regressing each team's observed home/away strength differential toward the league-average HFA as home/away sample size grows), rather than either a single global constant or a raw unregressed per-team split. See Known Limitations for why a naive per-team split isn't viable on its own.

- **Dynamic k** — Backtesting suggests the optimal shrinkage constant k isn't actually static across the season; it appears to shrink once a team has played 100+ games, meaning the current model likely over-weights the preseason prior in the second half of the season relative to what the data supports. A next iteration could make k a function of games played (or re-derive it using a per-date rather than per-season MSE objective) rather than a single fixed value.

- **Proper full-PMF delivery** — Replace the manual CSV upload workaround with an automated path. The leading candidate identified during the project is splitting the full PMF export into per-team tabs (each within Google Sheets' cell limit) and unioning them within Tableau, though this hasn't been built yet. A Google Sheets API-based push was considered and deferred to avoid adding credential management to the pipeline.

- **Resolve the Tableau duplication bug root cause** — The SUM-based duplication issue is currently mitigated by defaulting to AVG, but the underlying cause was never identified. Worth revisiting if it resurfaces in a new context (e.g., a future chart where AVG isn't a safe substitute).

- **General theming/cosmetic polish** — Continue tightening dashboard styling as usage reveals what does/doesn't work in practice.
