//3sum-closest
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        nums.sort()
        var ans = 0, diff = 100000
        if nums.count < 3 {
            return ans
        }
        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var left = i+1, right = nums.count-1
            while right > left {
                let result = nums[left] + nums[right] + nums[i]
                if diff > abs(result-target) {
                    ans = result
                    diff = abs(result-target)
                }
                if result < target {
                    left = left + 1
                } else if result > target {
                    right = right - 1
                } else {
                    return ans
                }
            }
        }
        return ans
    }
}