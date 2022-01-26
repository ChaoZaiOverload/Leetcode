//https://leetcode.com/problems/combinations/submissions/
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), current = [Int](), start = 1
        dfs(&ans, &current, start, n, k)
        return ans
    }

    func dfs(_ ans: inout [[Int]], _ current: inout [Int], _ start: Int, _ n: Int, _ k: Int) {
        if current.count == k {
            ans.append(current)
            return
        }
        let toFill = k - current.count
        if start > n-toFill+1 {
            return
        }
        for i in start...(n-toFill+1) {
            current.append(i)
            dfs(&ans, &current, i + 1, n, k)
            current.removeLast()
        }
    }
}