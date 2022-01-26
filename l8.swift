//string-to-integer-atoi
class Solution {
    func myAtoi(_ str: String) -> Int {
        var hasNumber = false
        var result: Int = 0
        var hasSign: Int = 0
        loop: for ch in str {
            switch ch {
                case " ":
                    if hasNumber || hasSign != 0 {
                        break loop
                    }
                case "+":
                    if hasNumber || hasSign != 0 {
                        break loop
                    }
                    hasSign = 1
                case "-":
                    if hasNumber || hasSign != 0 {
                        break loop
                    }
                    hasSign = -1
                case "0"..."9":
                    hasNumber = true
                    result = 10 * result + Int(String(ch))!
                    if hasSign == -1 && -result < Int32.min {
                        return Int(Int32.min)
                    }
                    if hasSign != -1 && result > Int32.max {
                        return Int(Int32.max)
                    }
                default:
                    break loop
            }
        }
        return hasSign != 0 ? result * hasSign : result
    }
}