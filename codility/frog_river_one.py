# Find the earliest moment when all the positions from 1 to X are covered by leaves

def solution(X, A):
    # sum all numbers from 1 to X (+1 includes X)
    valid_crossing = sum(range(1, X+1))

    # keep track of leaves in the path (use a set so that duplicates won't affect the sum)
    fallen_leaves = set()
    for i in range(len(A)):
        fallen_leaves.add(A[i])
        if sum(fallen_leaves) == valid_crossing:
            return i
    return -1

print(solution(5, [1, 3, 1, 4, 2, 3, 5, 4]))
print(solution(3, [1, 3, 1, 3, 2, 1, 3]))

# # O(N)
def solution(X, A):
    B = [0] * X

    s = 0
    for i in range(len(A)):
        if B[A[i]-1] == 0 and A[i] <= X:
            s += 1
            B[A[i]-1] = 1
        if s == X:
            return i 

    return -1

print(solution(5, [1, 3, 1, 4, 2, 3, 5, 4]))
print(solution(3, [1, 3, 1, 3, 2, 1, 3]))

# O(N)
def solution(X, A):
    B = [-1] * X
    for i in range(len(A)):
        if A[i] <= X and B[A[i]-1] == -1:
            B[A[i]-1] = i

    m = 0
    for i in range(len(B)):
        if B[i] == -1:
            return -1
        m = max(m, B[i])

    return m

print(solution(5, [1, 3, 1, 4, 2, 3, 5, 4]))
print(solution(3, [1, 3, 1, 3, 2, 1, 3]))