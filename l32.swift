//https://leetcode.com/problems/longest-valid-parentheses/
//TLE
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        if s.count < 2 {
            return 0
        }
        var ans = 0
        var dp: [Int] = Array(repeating: 0, count: s.count)
        for i in 1..<s.count {
            if s[i] == ")" && s[i-1] == "(" {
                dp[i] = i >= 2 ? (dp[i-2] + 2) : 2
            } else if s[i] == ")" && s[i-1] == ")" {
                let start = i - dp[i-1] - 1
                if start >= 0 && s[start] == "(" {
                    //print(start, dp, i)
                    dp[i] = dp[i-1] + 2 + (start > 0 ? dp[start-1] : 0)
                } else {
                    dp[i] = 0
                }
            } else {
                dp[i] = 0
            }
            ans = max(ans, dp[i])

        }
        return ans
    }
}

