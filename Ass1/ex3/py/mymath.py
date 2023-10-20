"""
This file contains all the math functions that I will use in my programs.
"""

import random

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

def lower_sqrt(n: int) -> int:
    """Return the lower square root of n

    Args:
        n (int): number to check
    Returns:
        int: lower square root of n
    """
    i = 1
    while i * i <= n:
        i += 1
    return i - 1

def is_probably_prime(n: int, k: int) -> bool:
    """Return True if n is prime, False otherwise

    Args:
        n (int): number to check
        k (int): number of iterations
    Returns:
        bool: True if n is probably prime, False otherwise
    """
    for i in range(k):
        a = random.randint(n - 1)
        if power(a, (n - 1)) % n != 1:
            return False
    return True

def is_prime(n: int) -> int:
    """Return True if n is prime, False otherwise

    Args:
        n (int): number to check
    Returns:
        bool: True if n is prime, False otherwise
    """
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, lower_sqrt(n) + 1, 2):
        if n % i == 0:
            return False
    return True

def find_nbit_prime(n: int) -> int:
    """Return the first n-bit prime number

    Args:
        n (int): number of bits
    Returns:
        int: the first n-bit prime number (between 2^(n-1) and 2^n)
    """
    while True:
        p = random.randint(power(2, (n - 1)), power(2, n))
        if is_prime(p):
            return p
