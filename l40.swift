//https://leetcode.com/problems/combination-sum-ii/submissions/
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var m: [Int: Int] = [:]
        var dp  = Array(repeating: [[Int]](), count: target + 1)
        dp[0] = [[]]
        let candidates = candidates.sorted()
        candidates.forEach {
            m[$0, default: 0] += 1
        }
        for num in m.keys.sorted() {
            if num > target {
                break
            }
            for subtarget in (num...target).reversed() {
                for i in 1...m[num]! where subtarget >= i * num {
                    for sol in dp[subtarget - i * num] {
                        dp[subtarget].append(sol + Array(repeating: num, count: i))
                    }
                }
            }
        }
        return dp[target]
    }
}