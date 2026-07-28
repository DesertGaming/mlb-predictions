--====== MLB Predictions Project DB Schema ======--


-- Reference Tables --

CREATE TABLE teams (
    team_id      SMALLINT PRIMARY KEY,  -- teams numbered 1-30
    team_abbr    VARCHAR(5) NOT NULL UNIQUE, -- official 3 letter abbreviations e.g. "NYY"
    team_name    VARCHAR(50) NOT NULL, -- full team name e.g. "Yankees"
    league       VARCHAR(2) NOT NULL, -- 'AL'/'NL'
    division     VARCHAR(10) NOT NULL -- 'AL East', 'NL West', etc.
);

CREATE TABLE preseason_estimates (
    season             SMALLINT NOT NULL,
    team_id            SMALLINT NOT NULL REFERENCES teams(team_id),
    vegas_win_line     NUMERIC(4, 1), -- Preseason Vegas O/U line for wins
    preseason_strength NUMERIC(5, 4) NOT NULL, -- O/U converted to win%
    source             VARCHAR(50), -- Vegas source for line
    PRIMARY KEY (season, team_id)
);


-- Schedule and Actual Results --

CREATE TABLE schedule (
    game_id        BIGINT PRIMARY KEY, -- pulled from MLB API
    season         SMALLINT NOT NULL,
    game_date      DATE NOT NULL,
    home_team_id   SMALLINT NOT NULL REFERENCES teams(team_id),
    away_team_id   SMALLINT NOT NULL REFERENCES teams(team_id),
    game_status    VARCHAR(20) NOT NULL DEFAULT 'scheduled', -- Identifies if a game has already happened
    home_runs      SMALLINT, -- NULL until game is finished
    away_runs      SMALLINT,
    CHECK(home_team_id <> away_team_id)
);

CREATE INDEX idx_schedule_date ON schedule(game_date);
CREATE INDEX idx_schedule_team_date ON schedule(home_team_id, away_team_id, game_date);


-- Daily Model Inputs --

CREATE TABLE daily_team_strength (
    as_of_date          DATE NOT NULL,
    season              SMALLINT NOT NULL,
    team_id             SMALLINT NOT NULL REFERENCES teams(team_id),
    games_played        SMALLINT NOT NULL,
    runs_scored         INT NOT NULL,
    runs_allowed        INT NOT NULL,
    pythagenpat_pct     NUMERIC(6, 5) NOT NULL, -- Expected win pct based on Pythagenpat formula
    alpha               NUMERIC(6, 5) NOT NULL, -- Weight applied to Pythagenpat
    preseason_strength  NUMERIC(6, 5) NOT NULL, -- copied from presason_estimates
    weighted_strength   NUMERIC(6, 5) NOT NULL, -- Final to-date strength estimate; Weighted average between Pythagenpat and Preseason Strength
    home_pct_to_date    NUMERIC(6, 5), -- Saved for future home field advantage weighing
    away_pct_to_date    NUMERIC(6, 5),
    PRIMARY KEY (as_of_date, team_id)
);

CREATE TABLE model_config (
    as_of_date   DATE PRIMARY KEY,
    k_constant   NUMERIC(6, 2) NOT NULL, -- Regression Constant; Expected # of games needed for Pythagenpat to stabilize
    hfa_constant NUMERIC(6, 5) NOT NULL, -- Constant boost for strength at home
    prob_floor   NUMERIC(5, 4) NOT NULL DEFAULT 0.05, -- Range to keep team strength in (0, 1)
    prob_ceiling NUMERIC(5, 4) NOT NULL DEFAULT 0.95,
    notes        VARCHAR(200)
);


-- Simulation Batch Metadata --

CREATE TABLE simulation_batches (
    batch_id       BIGINT PRIMARY KEY, -- Surroggate key
    as_of_date     DATE NOT NULL,
    season         SMALLINT NOT NULL,
    n_simulations  INT NOT NULL, -- Number of sims in the batch
    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(as_of_date, season) -- One canonical batch per date; Test batches have a new batch_id
);


-- Simulation Outputs --

CREATE TABLE daily_win_distribution (
    batch_id     BIGINT NOT NULL REFERENCES simulation_batches(batch_id),
    team_id      SMALLINT NOT NULL REFERENCES teams(team_id),
    final_wins   SMALLINT NOT NULL,
    sim_count    INT NOT NULL, -- How many of N sims produced this win total
    sim_pct      NUMERIC(7, 6) NOT NULL, -- sim_count / n_simulations
    PRIMARY KEY (batch_id, team_id, final_wins)
);

CREATE INDEX idx_win_dist_team ON daily_win_distribution(team_id, batch_id);