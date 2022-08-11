def solution(X, Y, D):
    """calculate number of steps it takes to move from
    X to Y in increments of D"""
    distance = Y - X
    steps = distance // D

    if (steps * D) < distance:
        steps += 1

    return steps


print(solution(10, 85, 30))
