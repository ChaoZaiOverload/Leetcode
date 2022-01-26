//https://leetcode.com/problems/permutations-ii/
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var ans = [[Int]](), result = [Int](), used = Array(repeating: false, count: nums.count)
        dfs(&ans, &result, nums, &used)
        return ans
    }

    func dfs(_ ans: inout [[Int]], _ result: inout [Int], _ nums: [Int], _ used: inout [Bool]) {
        if nums.count == result.count {
            ans.append(result)
            return
        }
        var m = Set<Int>()
        for (i, n) in nums.enumerated() where used[i] == false {
            if m.contains(n) {
                continue
            }
            m.insert(n)
            result.append(n)
            used[i] = true
            dfs(&ans, &result, nums, &used)
            used[i] = false
            result.removeLast()
        }
    }
}

class Solution_Iterative {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var current = [[Int]](), pre: [[Int]] = [[]]
        for n in nums {
            for sol in pre {
                for i in 0...sol.count {
                    if i > 0 && n == sol[i-1] {
                        break
                    }
                    var next = sol
                    next.insert(n, at: i)
                    current.append(next)
                }
            }
            pre = current
            current = [[Int]]()
        }
        return pre
    }
}