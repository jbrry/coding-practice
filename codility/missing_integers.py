def solution(A):
    A = sorted(A)

    # all negatives
    if A[-1] <= 0:
        return 1

    # doesn't contain 1
    found_one = False
    for i in range(len(A)):
        if A[i] == 1:
            found_one = True
    if found_one == False:
        return 1

    # difference between consecutive elements is > 1
    for i in range(len(A) -1):
        if A[i] > 0 and (A[i+1] - A[i]) > 1:
            return A[i] + 1

    # return end + 1
    return A[-1] +1


print(solution([1, 3, 6, 4, 1, 2]))
print(solution([1, 2, 3]))
print(solution([1, 3]))