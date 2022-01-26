//regular-expression-matching
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        // print(s,p)
        if p.count == 0 {
            return s.count == 0
        }

        let firstMatch = s.count > 0 && (p[0] == s[0] || p[0] == ".")

        if p.count > 1 && p[1] == "*" {
            return isMatch(s, String(p[2...])) || firstMatch && isMatch(String(s[1...]), p)
        } else {
            return firstMatch && isMatch(String(s[1...]), String(p[1...]))
        }
    }
}
class Solution2 {

    var dp: [[Bool?]] = [[]]

    func isMatch(_ s: String, _ p: String) -> Bool {
        // print(s,p)
        let ss = s.count, ps = p.count

        dp = Array(repeating: Array(repeating: nil, count: ps+1), count: ss+1)
        dp[ss][ps] = true
        return isMatchWithMemory(s, p, 0, 0)
    }

    func isMatchWithMemory(_ s: String, _ p: String, _ si: Int, _ pi: Int) -> Bool {
        if let ret = dp[si][pi] {
            return ret
        }

        let ret: Bool
        if pi == p.count {
            ret = si == s.count
            return ret
        }

        let firstMatch = s.count > si && (p[pi] == s[si] || p[pi] == ".")

        if p.count > pi+1 && p[pi+1] == "*" {
            ret = isMatchWithMemory(s, p, si, pi+2) || firstMatch && isMatchWithMemory(s, p, si+1, pi)
        } else {
            ret = firstMatch && isMatchWithMemory(s,p, si+1, pi+1)
        }
        dp[si][pi] = ret
        return ret
    }
}
