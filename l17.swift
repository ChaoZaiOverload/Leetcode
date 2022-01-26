//letter-combinations-of-a-phone-number
class Solution {
    var ans: [String] = []
    let digitToLetters:[Character:[Character]] = ["1": [],
                          "2": ["a", "b", "c"],
                         "3":["d","e", "f"],
                         "4":["g", "h","i"],
                         "5":["j","k","l"],
                         "6":["m","n","o"],
                         "7":["p","q","r","s"],
                         "8":["t","u","v"],
                         "9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return ans
        }
        backtrack("", digits, 0)
        return ans
    }

    func backtrack(_ combination: String, _ digits: String, _ ind: Int) {
        if ind == digits.count {
            ans.append(combination)
            return
        }
        if let letters = digitToLetters[digits[ind]] {
            for l in letters {
                backtrack(combination + String(l), digits, ind+1)
            }
        }
    }
}
