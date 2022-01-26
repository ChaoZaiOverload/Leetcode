//https://leetcode.com/problems/basic-calculator/
class Solution {
    func calculate(_ s: String) -> Int {
        let s = Array(s).filter { $0 != " " }
        var stk = [Int](), i = 0, localResult = 0, sign = 1, num = 0
        while i < s.count {
            if s[i] == "+" || s[i] == "-" {
                localResult += num * sign
                sign = s[i] == "-" ? -1:1
                num = 0
            } else if s[i] == "(" {
                stk.append(localResult)
                stk.append(sign)
                localResult = 0
                sign = 1
            } else if s[i] == ")" {
                localResult += num * sign
                num = 0
                let preSign = stk.removeLast()
                let preResult = stk.removeLast()
                localResult = preResult + preSign * localResult
            } else {
                let d = Int(String(s[i]))!
                num = num * 10 + d
            }
            i += 1
        }
        localResult += num * sign
        if stk.count > 0 {
            return stk[0]
        } else {
            return localResult
        }
    }
}