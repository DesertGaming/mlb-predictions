# Core mathematical functions for the simulation engine

import random

def log5(strength_a, strength_b):
    try:
        prob = (strength_a - (strength_a * strength_b)) / (strength_a + strength_b - (2 * strength_a * strength_b))
    except ZeroDivisionError:
        prob = 0.5
    return prob

def apply_hfa(base_probability, hfa_beta, prob_floor, prob_ceiling):
    adjusted = base_probability + hfa_beta
    return max(prob_floor, min(adjusted, prob_ceiling))

def choose_winner(win_probability):
    return random.random() < win_probability