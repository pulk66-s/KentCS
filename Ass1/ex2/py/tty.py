"""
This file contains all the functions that are used to communicate with the user
"""

def get_number(prompt: str) -> int:
    """This function will ask the user for a number and return it
    It will ask the user until he enters a valid number

    Arg:
        prompt (str): The prompt to display to the user
    Returns:
        int: The number entered by the user
    """
    while True:
        try:
            res = int(input(prompt))
            return res
        except:
            print("Please enter a valid number")
            continue
