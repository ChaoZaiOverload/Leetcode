//https://leetcode.com/problems/edit-distance/submissions/
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count, m = word2.count
        var dp = Array(repeating: Array(repeating: Int(Int32.max), count:m+1), count: n+1)
        for i in 0...m {
            dp[0][i] = i
        }
        for i in 0...n {
            dp[i][0] = i
        }

        if n == 0 || m == 0 {
            return dp[n][m]
        }

        for i in 1...n {
            for j in 1...m {
                var replace = dp[i-1][j-1]
                if word1[i-1] != word2[j-1] {
                    replace += 1
                }
                let insert = dp[i][j-1] + 1
                let delete = dp[i-1][j] + 1
                dp[i][j] = min(replace, insert)
                dp[i][j] = min(dp[i][j], delete)
            }
        }

        return dp[n][m]
    }
}
extension String {
    public subscript (i: Int) -> Character {
        let ind: String.Index = self.index(self.startIndex, offsetBy: i)
        return self[ind]
    }
}

//less space, O(m)
class Solution2 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count, m = word2.count
        var dp = Array(repeating: Array(repeating: Int(Int32.max), count:m+1), count: 2)
        for i in 0...m {
            dp[0][i] = i
        }

        if n == 0 {
            return m
        }

        for i in 1...n {
            for j in 0...m {
                if j == 0 {
                    dp[i%2][0] = i
                    continue
                }
                var replace = dp[(i-1)%2][j-1]
                if word1[i-1] != word2[j-1] {
                    replace += 1
                }
                let insert = dp[i%2][j-1] + 1
                let delete = dp[(i-1)%2][j] + 1
                dp[i%2][j] = min(replace, insert)
                dp[i%2][j] = min(dp[i%2][j], delete)
            }
        }

        return dp[n%2][m]
    }
}