//roman-to-integer
class Solution {
    func romanToInt(_ s: String) -> Int {
        let values = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        var ret = 0
        var i = 0, indS = 0
        while indS < s.count {
            while !s[indS...].hasPrefix(values[i]) {
                i = i + 1
            }
            indS = indS + values[i].count
            ret = ret + nums[i]
        }
        return ret
    }
}