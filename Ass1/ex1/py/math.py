"""
This file contains all the math functions that I will use in my programs.
"""

def power(n: int, e: int) -> int:
    """Return the power of a to b given in parameter
    I am using a fast exponentiation algorithm.

    Args:
        n (int): base
        e (int): exponent
    Returns:
        int: a^b
    """
    r = 1
    while e > 0:
        if e % 2 == 1:
            r *= n
        n *= n
        e //= 2
    return r
