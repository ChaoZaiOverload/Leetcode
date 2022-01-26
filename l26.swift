//https://leetcode.com/problems/remove-duplicates-from-sorted-array/submissions/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var start = 1
        for cur in 1..<nums.count {
            if nums[cur] != nums[cur-1] {
                nums[start]  = nums[cur]
                start += 1
            }
        }
        return start
    }
}