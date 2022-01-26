//https://leetcode.com/problems/divide-two-integers/
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min {
            if divisor == -1 {
                return Int(Int32.max)
            }
        }
        let sign: Int = (dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0) ? 1:-1
        var dividend = abs(dividend)
        let divisor = abs(divisor)

        if divisor > dividend {
            return 0
        }

        var multi = divisor, cnt = 1, result = 0
        while (multi << 1) <= dividend {
            multi = multi << 1
            cnt = cnt << 1
            if  (multi << 1) > dividend {
                dividend -= multi
                result += cnt
                multi = divisor
                cnt = 1
            }
        }
        if multi <= dividend {
            result += 1
        }
        return result * sign
    }
}