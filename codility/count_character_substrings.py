"""Count number of occurrences of characters in each substring."""

def solution(S):
    count = 0
    end = len(S)-1
    for i in range(len(S)):
        r = i
        # while r is in-bound and characters are the same.
        while r <= end and S[i] == S[r]:
            count += 1
            # scan right
            r += 1
    return count

print(solution("zzzyz"))
