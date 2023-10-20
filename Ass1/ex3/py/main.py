from tty import get_number
from math import find_nbit_prime

def main():
    n = get_number("Enter the number n: ")
    print(find_nbit_prime(n))

if __name__ == "__main__":
    main()
