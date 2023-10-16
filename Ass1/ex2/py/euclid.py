"""
This file contains the Extended Euclidean Algorithm function
"""

def eea(a: int, b: int) -> int:
    """This function calculates the GCD of a and b using the Extended Euclidean Algorithm

    Args:
        a (int): The first number
        b (int): The second number
    Returns:
        int: The GCD of a and b
    """
    r1, r = a, b
    s, s1 = 0, 1
    t, t1 = 1, 0
    print("The values of (r, s, t) in the initialisations of EEA are:", r, s, t)
    while r != 0:
        q = r1 // r
        r1, r = r, r1 - q * r
        s1, s = s, s1 - q * s
        t1, t = t, t1 - q * t
        print("The values of (r, s, t) in the step of EEA are:", r, s, t)
    d, x, y = r1, s1, t1
    print("The values of (r, s, t) at the end of EEA are:", r, s, t)
    print("The values of (r1, s1, t1) at the end of EEA are:", r1, s1, t1)
    return d, x, y
