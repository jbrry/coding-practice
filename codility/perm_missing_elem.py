def solution(A):
    A.sort()
    for i in range(len(A)):
        if (A[i] + 1) != A[i + 1]:
            return A[i] + 1


print(solution([2, 3, 1, 5]))
print(solution([3, 2, 1, 4, 6, 5, 7, 8, 10]))