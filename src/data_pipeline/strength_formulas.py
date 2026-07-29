# Defining mathematical equations for calculating strength estimates

def pythagenpat(games_played, runs_scored, runs_allowed):
    """
    Calculates a teams expected winning percentage / strength given runs scored and allowed over a period of games.
    Returns .500 for no games played, as a neutral estimate, avoiding a ZeroDivisionError.
    """
    if games_played == 0:
        return 0.5
    
    exponent = ((runs_scored + runs_allowed) / games_played) ** 0.287

    return (runs_scored ** exponent) / ((runs_scored ** exponent) + (runs_allowed ** exponent))

def stabilizing_coefficient(games_played, k):
    """
    Coefficient for weighing strength of sample input vs preseason estimates.
    """
    return games_played / (games_played + k)

def weighted_estimate(alpha, preseason, pythagenpat):
    """
    Calculates a weighted strength estimate between preseason estimates and Pythagenpat estimates.
    """
    return ((1 - alpha) * preseason) + (alpha * pythagenpat)