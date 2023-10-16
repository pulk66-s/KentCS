from tty import get_number
from euclid import eea

def main():
    a = get_number("Enter the number a: ")
    b = get_number("Enter the number b: ")
    print(f"The values of (g, x, y) are: {eea(a, b)}")
    
if __name__ == "__main__":
    main()
