//4sum
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]]  {
        var nums = nums
        nums.sort()
        return kSum(nums, target, 4)
    }

    func kSum(_ nums: [Int], _ target: Int, _ k: Int) -> [[Int]] {
        if nums.count < k {
            return []
        }
        if k == 2 {
            return twoSum(nums, target)
        }
        var ans = [[Int]]()
        for i in 0..<nums.count-k+1 {
            if i > 0 && nums[i-1] == nums[i] {
                continue
            }
            for res in kSum(Array(nums[(i+1)...]), target - nums[i], k-1) {
                ans.append([nums[i]] + res)
            }
        }
        return ans
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {

        if nums.count == 0 {
            return []
        }
        var m = Set<Int>(), result = [[Int]]()
        for i in 0..<nums.count {
            if m.contains(target - nums[i]) {
                if let last = result.last, last[1] == nums[i] {
                    continue
                } else {
                    result.append([target - nums[i], nums[i]])
                }
            }
            m.insert(nums[i])
        }
        return result
    }
}