from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:

        indices = []
        for l in range(len(nums)):
            for r in range(l + 1, len(nums)):
                _sum = nums[l] + nums[r]
                if _sum == target:
                    indices.append(l)
                    indices.append(r)
        return indices


s = Solution()

nums_list = [[2, 7, 11, 15], [3, 2, 4], [3, 3]]
targets_list = [9, 6, 6]
answers = [[0, 1], [1, 2], [0, 1]]

for i, (nums, target) in enumerate(zip(nums_list, targets_list)):
    indices = s.twoSum(nums, target)
    assert indices == answers[i]
    print(nums, target)
