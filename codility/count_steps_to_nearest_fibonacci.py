"""
Task: Given an input `X` of type `int`, calculate the minimum number of steps needed to change X to a Fibonacci number.

Conditions:
- X will be between 0 and 1,000,000 (inclusive).
- Each step you can increment or decrement the current number, e.g. x = x+1, x = x-1.
- E.g. if X=15, return 2. if x=1 or x=13, the function should return 0.
"""


def solution(X):
    """Finds the number of steps needed to change X to a Fibonacci number."""

    print(f"starting with x={X}")
    assert X >= 0
    a, b = 0, 1  # first two Fibonacci numbers are given.
    while b < X:
        print("---------")
        nf = a + b
        print(f"nf={nf}")
        a, b = b, nf # a is always smaller than b as b is the two added together
        print(f"a={a} b={b}")
    # Note: Now either b == X or b was smaller than X in the previous step meaning
    #       that a is now smaller than X, i.e. X is between a and b

    # get difference between each Fibonacci number and the input number
    print("diffs")
    diff_a = X - a  # steps to a
    print("diff a", diff_a)
    diff_b = b - X  # steps to b
    print("diff b", diff_b)
    min_value = min(diff_a, diff_b)
    steps = min_value
    return steps



# def solution(X):
#     """Finds the number of steps needed to change X to a Fibonacci number."""
#     # populate array with Fibonacci numbers
#     f = [0, 1] # first two elements are given.
#     for n in range(2, 100000, 1):
#         nf = f[n-1] + f[n-2]
#         # input X is between 0 and 1M, consider fibonacci numbers which are higher
#         if nf <= 2000000:
#             f.append(nf)
#         else: break

#     # get difference between each Fibonacci number and the input number
#     diffs = [abs(i - X) for i in f]
#     min_index = diffs.index(min(diffs))
#     min_value = f[min_index]


#     steps = 0
#     if X > min_value:
#         while X != min_value:
#             steps += 1
#             X -= 1
#     elif X < min_value:
#         while X != min_value:
#             steps += 1
#             X += 1


#     print(min_value, steps)
#     assert min_value == steps
#     return steps

print(solution(15))
# print(solution(13))
# print(solution(1))
# print(solution(87))