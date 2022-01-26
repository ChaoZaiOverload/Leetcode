//3sum
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var ans = [[Int]]()
        if nums.count < 3 {
            return ans
        }
        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var m = Set<Int>()
            var found: Int? = nil
            for j in i+1..<nums.count {
                if let found = found, found == nums[j] {
                    continue
                }
                if m.contains(-nums[i] - nums[j]) {
                    ans.append([nums[i], -nums[i] - nums[j], nums[j]])
                    found = nums[j]
                } else {
                    m.insert(nums[j])
                }
            }
        }
        return ans
    }
}