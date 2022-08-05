"""
Convert Decimal to Hexspeak (https://en.wikipedia.org/wiki/Hexspeak) representation.
To convert a number to Hexspeak, the number needs to be converted to hexadecimal.
Then, the number 0 is converted to the letter "O" and the number 1 is converted to the letter "I".
A string is considered valid Hexspeak if it consists of only the ABCDEFIO letters.

Alternative solution: https://www.tutorialspoint.com/hexspeak-in-python
"""

def solution(S):
    """
    Inputs:
        `S` a string encoding a decimal integer `N`.

    Returns:
        `output_string`: Hexspeak representation of N if output_string is a valid Hexspeak word,
        otherwise return "ERROR".
    """
    # Hexspeak dictionary
    d = {0: "O", 1: "I", 10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"}

    def get_divmod(q):
        """Divides the number by 16 and returns the integer quotient and remainder."""
        q, mod = divmod(q, 16)
        return q, mod

    def get_remainders(q):
        if q == 0:
            return []
        q, mod = get_divmod(q)
        return [mod] + get_remainders(q)

    q = int(S)
    remainders = get_remainders(q)
    output_string = ""
    # go through remainders in reverse and access string value from alphabet
    while remainders:
        r = remainders.pop()
        if r not in d:
            return "ERROR"
        else:
            output_string += d[r]
    return output_string

print(solution("659724"))
print(solution("0"))
print(solution("1"))
print(solution("4512"))
print(solution("257")) # "101"
print(solution("3")) # "ERROR"