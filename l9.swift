//palindrome-number
class Solution {
    func isPalindrome(_ xx: Int) -> Bool {
        var reversed = 0, x = xx
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        while reversed < x {
            reversed = 10 * reversed + x % 10
            x = x / 10
        }
        return reversed == x || reversed / 10 == x
    }
}