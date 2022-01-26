//https://leetcode.com/problems/valid-number/submissions/
class Solution {
    func isNumber(_ s: String) -> Bool {
        var hasSign = false, hasE = false, hasDot = false, hasNum = false
        let validChars: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "e", ".", "+", "-"]

        let s = s.trimmingCharacters(in: .whitespacesAndNewlines)
        for i in 0..<s.count {
            if !validChars.contains(s[i]) {
                return false
            }

            if s[i] == "-" || s[i] == "+" {
                if (i > 0 && s[i-1] != "e") {
                    return false
                }

                hasSign = true
                hasNum = false
            }
            else if s[i] == "." {
                if hasE || hasDot {
                    return false
                }

                hasDot = true
            }
            else if s[i] == "e" {
                if hasE || !hasNum {
                    return false
                }
                hasE = true
                hasNum = false
            } else {
                hasNum = true
            }


        }
        return hasNum
    }
}

extension String {
    public subscript (i: Int) -> Character {
        let ind: String.Index = self.index(self.startIndex, offsetBy: i)
        return self[ind]
    }
}
