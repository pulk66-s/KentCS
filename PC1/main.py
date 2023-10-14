##
## Ex 1
##
def nbit_nb(n):
    return [bin(i)[2:] for i in range(2**n)]

def ex1():
    for i in range(7):
        print(f"{i}: ", end="")
        print(*nbit_nb(i))

##
## Ex2
##
def floor(x):
    return x - (x % 1)

def ex2():
    print("floor 20", floor(20))
    print("floor 20 / 7", floor(20 / 7))
    print("floor 22 / 7", floor(22 / 7))
    print("floor 22 / 27", floor(22 / 27))
    print("floor -22 / 7", floor(-22 / 7))
    print("floor -20 / 7", floor(-20 / 7))
    print("floor -20", floor(-20))

##
## Ex3
##
def euclidian_rec(a, b):
    return euclidian_rec(b, a % b) if a != 0 and b != 0 else max(a, b)

def euclidian_iter(a, b):
    r = b
    while r != 0:
        r = a % b
        a = b
        b = r
    return a

def ex3():
    print("gcd(20, 7)", euclidian_rec(20, 7))
    print("gcd(20, 27)", euclidian_rec(20, 27))
    print("gcd(22, 27)", euclidian_rec(22, 27))
    print("gcd(12, 6)", euclidian_rec(12, 6))

    print("gcd(20, 7)", euclidian_iter(20, 7))
    print("gcd(20, 27)", euclidian_iter(20, 27))
    print("gcd(22, 27)", euclidian_iter(22, 27))
    print("gcd(12, 6)", euclidian_iter(12, 6))

##
## Ex4
##
def exp_naive(n, e):
    r = 1
    for i in range(e):
        r *= n
    return r

def exp_recursive(n, e):
    return n * exp_recursive(n, e - 1) if e > 0 else 1

def exp_non_recu(n, e):
    r = 1
    while e > 0:
        if e % 2 == 1:
            r *= n
        n *= n
        e //= 2
    return r

def ex4():
    print("exp_naive(2, 3)", exp_naive(2, 3))
    print("exp_naive(10, 4)", exp_naive(10, 4))
    print("exp_naive(-1, 4)", exp_naive(-1, 4))
    print("exp_naive(-1, 5)", exp_naive(-1, 5))

    print("exp_recursive(2, 3)", exp_recursive(2, 3))
    print("exp_recursive(10, 4)", exp_recursive(10, 4))
    print("exp_recursive(-1, 4)", exp_recursive(-1, 4))
    print("exp_recursive(-1, 5)", exp_recursive(-1, 5))

    print("exp_non_recu(2, 3)", exp_non_recu(2, 3))
    print("exp_non_recu(10, 4)", exp_non_recu(10, 4))
    print("exp_non_recu(-1, 4)", exp_non_recu(-1, 4))
    print("exp_non_recu(-1, 5)", exp_non_recu(-1, 5))

##
## Ex5
##
def Zn(n):
    return [[(i + j) % n for j in range(n)] for i in range(n)]

def ka(n):
    return [[(a * k) % n for k in range(1, n + 1)] for a in range(n)]

def Zstar(n):
    return [i for i in range(n) if euclidian_rec(i, n) == 1]

def ZstarI(n):
    return [[a**i % n for i in range(1, n + 1)] for a in Zstar(n)]

def Zstar2(n):
    z = Zstar(n)
    return [[i * j % n for j in z] for i in z]

def ex5():
    z12 = Zn(12)
    print("Z12")
    for l in z12:
        print("\t".join(map(str, l)))
    print("ka")
    for i, l in enumerate(ka(5)):
        print(i, ":", "\t".join(map(str, l)))
    print("ZStar")
    zstar = Zstar(12)
    print(*map(str, zstar))
    print("ZStarI")
    zstari = ZstarI(12)
    for i, l in enumerate(zstari):
        print(i, ":", "\t".join(map(str, l)))
    print("ZStar2")
    zstar2 = Zstar2(12)
    for i, l in enumerate(zstar2):
        print(i, ":", "\t".join(map(str, l)))
    

##
## Main function to launch every exercice
##
def main():
    ex1()
    ex2()
    ex3()
    ex4()
    ex5()

if __name__ == "__main__":
    main()
