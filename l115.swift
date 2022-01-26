//https://leetcode.com/problems/distinct-subsequences/
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let n = s.count, m = t.count
        let s = Array(s), t = Array(t)
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        for i in 0...n {
            for j in 0...m {
                if j == 0 {
                    dp[i][j] = 1
                    continue
                }
                if i == 0 {
                    dp[i][j] = 0
                    continue
                }
                dp[i][j] = i > 0 ? dp[i-1][j] : 0
                if s[i-1] == t[j-1] {
                    dp[i][j] += dp[i-1][j-1]
                }
            }
        }
        return dp[n][m]
    }
}
