//Longest Substring Without Repeating Characters
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0, j = 0, ans = 0, cSet = Set<Character>()
        let len = s.count

        while j < len {
            if cSet.contains(s[j]) {
                cSet.remove(s[i])
                i = i + 1
            } else {
                cSet.insert(s[j])
                ans = max(ans, j - i + 1)
                j = j + 1
            }
        }
        return ans
    }
}

class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0, j = 0, ans = 0, cInd = [Character:Int]()
        let len = s.count

        while j < len {
            if let ind = cInd[s[j]], ind >= i {
                i = ind + 1
            }
            ans = max(ans, j - i + 1)
            cInd[s[j]] = j
            j = j + 1
        }
        return ans
    }
}

