from math import power
from tty import get_number

def main():
    m = get_number("Enter m: ")
    e = get_number("Enter e: ")
    n = get_number("Enter n: ")
    res = power(m, e) % n
    print("Result:", res)

if __name__ == "__main__":
    main()
