//https://leetcode.com/problems/generate-parentheses/
class Solution {
    var result = [String]()
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return result
        }
        generate("", 0, 0, n)
        return result
    }

    func generate(_ combination: String, _ openCount: Int, _ closeCount: Int, _ n: Int) {
        if openCount == n && closeCount == n {
            result.append(combination)
            return
        }
        if openCount < n {
            generate(combination + "(", openCount + 1, closeCount, n)
        }
        if closeCount < openCount {
            generate(combination + ")", openCount, closeCount + 1, n)
        }
    }
}