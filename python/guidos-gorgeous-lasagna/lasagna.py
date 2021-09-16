EXPECTED_BAKE_TIME = 40
MINUTES_PER_LAYER = 2


def bake_time_remaining(time: int) -> int:
    """
    return the remaining bake time for lasagne
    """
    return EXPECTED_BAKE_TIME - time


def preparation_time_in_minutes(layers: int) -> int:
    """
    return the prepartion time in minutes given the number of layer
    """
    return layers * MINUTES_PER_LAYER


def elapsed_time_in_minutes(layers: int, time: int) -> int:
    """
    return the total elasped time for preparation plus baking
    """
    return preparation_time_in_minutes(layers) + time
