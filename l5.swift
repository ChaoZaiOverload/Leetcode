class Solution {
    func longestPalindrome(_ str: String) -> String {
        let len = str.count
        if len < 2 {
            return str
        }
        var dp = Array(repeating: Array(repeating: false, count: len), count: len)
        var ans = ""
        for s in 1...len {
            for i in 0..<len-s+1 {
                if s == 1 {
                    dp[i][i] = true
                }
                if s == 2 {
                    dp[i][i+s-1] = str[i] == str[i+s-1]
                }

                if s > 2 {
                    dp[i][i+s-1] = dp[i+1][i+s-2] && str[i] == str[i+s-1]
                }

                if ans.count < s && dp[i][i+s-1] {
                    ans = String(str[i...i+s-1])
                }
            }
        }
        return ans
    }
}

