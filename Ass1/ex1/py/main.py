from math import power
from tty import get_number

def main():
    base = get_number("Enter base: ")
    exponent = get_number("Enter exponent: ")
    res = power(base, exponent)
    print("Result:", res)

if __name__ == "__main__":
    main()
