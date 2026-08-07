# Core function for running simulations and saving distributions

from src.simulation.log5 import log5, apply_hfa, choose_winner
from collections import Counter, defaultdict
from psycopg2.extras import execute_values


def sim(cur, as_of_date, n_simulations):
    params_query = "SELECT k_constant, hfa_constant, prob_floor, prob_ceiling FROM model_config ORDER BY as_of_date DESC LIMIT 1;"
    strength_query = "SELECT team_id, weighted_strength FROM daily_team_strength WHERE as_of_date = %s;"
    wins_query = """WITH games AS (
                        SELECT home_team_id AS team_id, CASE WHEN home_runs > away_runs THEN 1 ELSE 0 END AS win
                        FROM schedule
                        WHERE game_date <= %s AND EXTRACT(YEAR FROM game_date) = %s AND game_status IN ('Final', 'Completed Early')
                        UNION ALL
                        SELECT away_team_id AS team_id, CASE WHEN away_runs > home_runs THEN 1 ELSE 0 END AS win
                        FROM schedule
                        WHERE game_date <= %s AND EXTRACT(YEAR FROM game_date) = %s AND game_status IN ('Final', 'Completed Early')
                        )
                    SELECT team_id, SUM(win) as wins_so_far
                    FROM games
                    GROUP BY team_id;"""
    schedule_query = "SELECT home_team_id, away_team_id FROM schedule WHERE game_date > %s AND EXTRACT(YEAR FROM game_date) = %s;"

    cur.execute(params_query)
    k, hfa_beta, prob_floor, prob_ceiling = cur.fetchone()
    k = float(k)
    hfa_beta = float(hfa_beta)
    prob_floor = float(prob_floor)
    prob_ceiling = float(prob_ceiling)

    cur.execute(strength_query, (as_of_date,))
    raw_strengths = cur.fetchall()
    strengths_dict = {}
    for team_id, weighted_strength in raw_strengths:
        strengths_dict[team_id] = float(weighted_strength)

    season = as_of_date.year
    cur.execute(wins_query, (as_of_date, season, as_of_date, season))
    raw_wins = cur.fetchall()
    wins_dict = {}
    for team_id, wins_so_far in raw_wins:
        wins_dict[team_id] = float(wins_so_far)

    cur.execute(schedule_query, (as_of_date, season))
    remaining_schedule = cur.fetchall()

    win_distributions = defaultdict(list)
    for n in range(n_simulations):
        temp_wins = wins_dict.copy()
        for home_team_id, away_team_id in remaining_schedule:
            init_win_prob = log5(strengths_dict[home_team_id], strengths_dict[away_team_id])
            final_win_prob = apply_hfa(init_win_prob, hfa_beta, prob_floor, prob_ceiling)
            winner = choose_winner(final_win_prob)
            if winner:
                temp_wins[home_team_id] += 1
            else:
                temp_wins[away_team_id] += 1
        for team_id, wins in temp_wins.items():
            win_distributions[team_id].append(wins)

   
    final_batch_dist = []
    for team_id, totals in win_distributions.items():
        counts = Counter(totals)
        for final_wins, count in counts.items():
            final_batch_dist.append((team_id, final_wins, count, count / n_simulations))

    cur.execute("INSERT INTO simulation_batches (as_of_date, season, n_simulations) VALUES (%s, %s, %s) RETURNING batch_id;",
    (as_of_date, season, n_simulations))
    batch_id = cur.fetchone()[0]

    rows = [(batch_id, team_id, final_wins, count, sim_pct) 
        for team_id, final_wins, count, sim_pct in final_batch_dist]

    insert_sql = """INSERT INTO daily_win_distribution (batch_id, team_id, final_wins, sim_count, sim_pct)
                    VALUES %s;"""

    execute_values(cur, insert_sql, rows)



