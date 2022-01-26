//https://leetcode.com/problems/maximum-subarray/submissions/
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var left = 0, right = left, maxSum = Int(Int32.min), cur = 0
        while left <= right && right < nums.count {
            cur += nums[right]
            maxSum = max(cur, maxSum)

            while cur < 0 && left <= right {
                cur -= nums[left]
                left += 1
            }
            if left > right && left < nums.count {
                right = left
                cur = 0
                continue
            }
            right += 1
        }
        return maxSum
    }
}