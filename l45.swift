//https://leetcode.com/problems/jump-game-ii/

class Solution {
    func jump(_ nums: [Int]) -> Int {
        var cnt = 0, current = 0
        while current < nums.count-1 {
            if current + nums[current] >= nums.count-1 {
                cnt += 1
                break
            }
            var maxInd = current+1
            for i in current+1...current+nums[current] {
                if nums[i] + i > nums[maxInd] + maxInd {
                    maxInd = i
                }
            }
            current = maxInd
            cnt += 1
        }
        return cnt
    }
}