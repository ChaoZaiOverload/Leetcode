//https://leetcode.com/problems/subsets/submissions/
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let len = nums.count
        let total = Int(pow(2.0, Double(len)))
        var ans = [[Int]]()
        for i in 0..<total {
            var comb = [Int](), ni = 0, k = i
            while k > 0 {
                if k & 1 == 1 {
                    comb.append(nums[ni])
                }
                ni += 1
                k = k >> 1
            }
            ans.append(comb)
        }
        return ans
    }
}