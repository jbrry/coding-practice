# this solution works but involves creating a second array B
def alternative_solution(A, K):
    for c in range(K):
        B = [0] * len(A)
        for i in range(len(A)):
            B[i] = A[i -1]
        A = B

    return A

# this solution modifies the array in place
def solution(A, K):
    for c in range(K):
        for i in range(len(A)):
            A[i], A[-1] = A[-1], A[i]
    
    return A


print(solution([3, 8, 9, 7, 6], 3))
print(solution([0, 0, 0], 1))
print(solution([1, 2, 3, 4], 4))