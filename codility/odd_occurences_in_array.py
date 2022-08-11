def brute_solution(A):
    # slow but easy solution
    matches = []
    for i in range(len(A)):
        for j in range(i + 1, len(A)):
            if A[i] == A[j]:
                matches.append(A[i])

    # scan for missing elem
    for i in range(len(A)):
        if A[i] not in matches:
            return A[i]


def solution(A):
    if len(A) == 1:
        return A[0]
    A.sort()
    for i in range(0, len(A) - 1, 2):  # stop before last element
        if A[i] != A[i + 1]:
            return A[i]
    return A[-1]


print(brute_solution([9, 3, 9, 3, 9, 7, 9]))
print(solution([9, 3, 9, 3, 9, 7, 9]))
