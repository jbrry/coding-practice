def reverse(A):
    N = len(A)

    for i in range(N // 2):  # get first half of array
        k = N - i - 1  # get corresponding index in second half of array
        A[i], A[k] = A[k], A[i]  # set first as last, and last as first

    return A

print(reverse([6, 5, 4, 3, 2, 1]))
