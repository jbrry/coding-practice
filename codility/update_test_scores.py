# https://github.com/wtsanshou/Coding/blob/master/DataStructure/LinearStructure/Array/Traversal/CodilityUpdateScores.md

def solution(A):
    """
    A:  An arrray of initial test scores.
    
    Test scores change if the student to the left and right both have higher scores or both have lower scores.
    We do not consider the first and last student as they do not have two neighbours.

    Returns:
        An array of integers representing final test scores.     
    """
    end = len(A)-1
    changeFlag = True

    while changeFlag:
        update_array = [0] * len(A)
        for i in range(1, end, 1):
            # both neighbours have higher scores
            if A[i-1] > A[i] and A[i+1] > A[i]:
                update_array[i] = 1
            # both neighbours have lower scores
            elif A[i-1] < A[i] and A[i+1] < A[i]:
                update_array[i] = -1
        
        # If there are updates (1 or -1), then do element-wise addition with A.
        if set([1, -1]).issubset(update_array):
            A = [sum(value) for value in zip(A, update_array)]
        # No more updates, set flag to False and exit loop.
        else:
            changeFlag = False
    
    return A

print(solution([1,6,3,4,3,5])) # -> [1, 4, 4, 4, 4, 5]
print(solution([100, 50, 40, 30])) # -> [100, 50, 40, 30]