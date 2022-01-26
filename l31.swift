//https://leetcode.com/problems/next-permutation/submissions/
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        //3654, 4356; 366, 636
        for i in (0..<nums.count).reversed() {
            if i > 0 && nums[i-1] < nums[i] {
                if let toSwap = (nums.lastIndex { $0 > nums[i-1] })
                {
                    nums.swapAt(toSwap, i-1)
                }
                nums = nums[0..<i] + nums[i...].reversed()
                return
            }
        }
        nums = nums.reversed()
    }
}