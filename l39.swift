//https://leetcode.com/problems/combination-sum/submissions/
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        let candidates = candidates.sorted()

        var current =  [Int]()
        backtrace(candidates, &current, 0, target, &ans)
        return ans
    }

    func backtrace(_ candidates: [Int], _ current: inout [Int], _ start: Int, _ target: Int, _ ans: inout [[Int]] ) {
        if target == 0 {
            ans.append(current)
            return
        }
        for i in start..<candidates.count {
            if candidates[i] > target {
                break
            }
            current.append(candidates[i])
            backtrace(candidates, &current, i, target - candidates[i], &ans)
            current.removeLast()
        }
    }
}