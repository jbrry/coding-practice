def solution(N):
    N = bin(N)[2:]

    count = 0
    _max = 0

    for i in N:
        if int(i) == 0:
            count += 1
        elif int(i) == 1:
            _max = max(_max, count)
            count = 0

    return _max


print(solution(32))
print(solution(529))
