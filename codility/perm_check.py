# A permutation is a sequence containing each element from 1 to N once, and only once.

def solution(A):
    A = sorted(A)
    s = set(A)
    if len(s) != len(A): # it can't be a permutation if the numbers aren't consecutive
        return 0
    l = sorted(list(s)) # turn set back into (sorted) list, so we can count upwards
    # sum all items in l and check if equal to the sum of all numbers from 1 to N
    if sum(l) != sum(range(1, (len(A)+1))):
        return 0
    return 1


print(solution([4, 1, 3, 2]))
print(solution([4, 1, 3]))
print(solution([1, 1]))


def solution(A):
    if len(A) == 0:
        return 0
    A.sort()
    for i in range(len(A)):
        if A[i] != i+1: # Array should contain the numbers 1 -> N (starting from 1)
            return 0
    return 1


print(solution([4, 1, 3, 2]))
print(solution([4, 1, 3]))
print(solution([1, 1]))