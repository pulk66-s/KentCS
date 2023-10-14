from math import *
from random import *

"""
ex1
"""
def exhaustive_prime_search(n):
    for i in range(2, int(sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

def exhaustive_and_fermat(n, k):
    for p in range(2, 100):
        if n % p == 0:
            return p
    for i in range(k):
        a = randint(100, n - 1)
        if a ** (n - 1) % n != 1:
            return a
    return True


"""
ex2
"""
def extended_euclid(a, b):
    r1 = a
    r = b
    s = 0
    s1 = 1
    t = 1
    t1 = 0
    while r != 0:
        q = r1 // r
        r1, r = r, r1 - q * r
        s1, s = s, s1 - q * s
        t1, t = t, t1 - q * t
    d = r1
    x = s1
    y = t1
    return d, x, y

def Zn(n):
    return [i for i in range(1, n)]

def Zn_star(n):
    return [i for i in range(1, n) if extended_euclid(n, i)[0] == 1]

def ex2():
    while True:
        nb = input("Enter a number: ")
        if nb == "exit":
            break
        nb = int(nb)
        print("EX2")
        print(extended_euclid(nb, 7))
        print(extended_euclid(nb, 11))
        for i in Zn(nb):
            print("i", i, ": ", extended_euclid(nb, i))
        print("===")
        for i in Zn_star(nb):
            print("i", i, ": ", extended_euclid(nb, i))

def ex1():
    while True:
        nb = input("Enter a number: ")
        if nb == "exit":
            break
        nb = int(nb)
        print("EX1")
        print(exhaustive_prime_search(nb))
        print("===")
        print(exhaustive_and_fermat(nb, 50))
        print("end")

def main():
    ex1()
    ex2()

if __name__ == "__main__":
    main()
