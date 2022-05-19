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
        students_to_increase = []
        students_to_decrease = []
        for i in range(1, end, 1):
            # both neighbours have higher scores
            if A[i-1] > A[i] and A[i+1] > A[i]:
                students_to_increase.append(i)
            # both neighbours have lower scores
            elif A[i-1] < A[i] and A[i+1] < A[i]:
                students_to_decrease.append(i)

        if students_to_increase:
            changeFlag = True
            for i in students_to_increase:
                A[i] += 1
        else:
            changeFlag = False

        if students_to_decrease:
            changeFlag = True
            for i in students_to_decrease:
                A[i] -= 1
        else:
            changeFlag = False

    return A

print(solution([1,6,3,4,3,5])) # -> [1, 4, 4, 4, 4, 5]
print(solution([100, 50, 40, 30])) # -> [100, 50, 40, 30]




#1 4 4 4 4 5