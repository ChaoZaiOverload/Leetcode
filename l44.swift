//https://leetcode.com/problems/wildcard-matching/
//TLE

class Solution2 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p == "" {
            return s == ""
        }
        if s == "" {
            return p[0] == "*" && isMatch(s, p[1...])
        }
        if p[0] == "?" {
            return isMatch(s[1...], p[1...])

        } else if p[0] == "*" {
            for i in 0...s.count {
                if isMatch(s[i...], p[1...]) {
                    return true
                }
            }
            return false
        } else {
            return p[0] == s[0] && isMatch(s[1...], p[1...])
        }
    }
}


class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp = Array(repeating: Array(repeating: false, count: p.count+1), count: s.count+1)

        dp[s.count][p.count] = true
        for pi in (0...p.count).reversed() {
            for si in (0...s.count).reversed() {
                if pi == p.count && si == s.count {
                    continue
                }

                if si == s.count {
                    dp[si][pi] = p[pi] == "*" && dp[si][pi+1]
                } else if pi == p.count {
                    dp[si][pi] = false
                } else {
                    let isFirstMatch = p[pi] == "?" || p[pi] == s[si]
                    if p[pi] != "*" {
                        dp[si][pi] = isFirstMatch && dp[si+1][pi+1]
                    } else {
                        dp[si][pi] = false
                        for k in si...s.count {
                            if dp[k][pi+1] {
                                dp[si][pi] = true
                                break
                            }
                        }
                    }
                }

            }
        }
        return dp[0][0]
    }
}
