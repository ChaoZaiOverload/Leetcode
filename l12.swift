//integer-to-roman
class Solution {
    func intToRoman(_ num: Int) -> String {
        var num = num
        var ans = ""
        if num / 1000 > 0 {
            for _ in 0..<num/1000 {
                ans.append("M")
            }
            num = num % 1000
        }
        if num / 100 == 9 {
            ans.append("CM")
            num = num - 900
        }
        if num / 100 == 4 {
            ans.append("CD")
            num = num - 400
        }
        if  num / 500 > 0 {
            ans.append("D")
            num = num - 500
        }
        if num / 100 > 0 {
            for _ in 0..<num/100 {
                ans.append("C")
            }
            num = num % 100
        }
        if num / 10 == 9 {
            ans.append("XC")
            num = num - 90
        }
        if num / 10 == 4 {
            ans.append("XL")
            num = num - 40
        }
        if num / 50 > 0{
            ans.append("L")
            num = num - 50
        }
        if num / 10 > 0 {
            for _ in 0..<num/10 {
                ans.append("X")
            }
            num = num % 10
        }
        if num == 9 {
            ans.append("IX")
            num = num - 9
        }
        if num == 4 {
            ans.append("IV")
            num = num - 4
        }
        if num / 5 > 0 {
            ans.append("V")
            num = num - 5
        }
            for _ in 0..<num {
                ans.append("I")
            }

        return ans
    }

}