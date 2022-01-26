//https://leetcode.com/problems/substring-with-concatenation-of-all-words/discuss/?currentPage=1&orderBy=hot&query=
// time limit exceed 172 / 173 test cases passed
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.count == 0 {
            return []
        }
        var result = [Int]()
        var dict = [String: Int]()
        words.forEach {
            dict[$0, default:0] += 1
        }
        let len = words[0].count, wcount = words.count, tlen = len * wcount
        guard tlen <= s.count else {
            return []
        }
        for i in 0..<len {
            var left = i, right = i, rdict = dict, found = 0
            while right + len <= s.count {
                //print(left, right, rdict)
                let w = s[right..<(right+len)]
                right += len
                if let cnt = rdict[w] {
                      rdict[w]! -= 1
                        if cnt == 1 {
                            found += 1
                        }
                } else {
                    left = right
                    rdict = dict
                    found = 0
                    continue
                }

                if right - left != tlen {
                    continue
                }
                if found == rdict.count {
                    result.append(left)
                }
                let w2 = s[left..<(left+len)]
                if let cnt = rdict[w2] {
                    rdict[w2]! += 1
                    if cnt == 0 {
                        found -= 1
                    }
                }
                left += len
            }
        }
        return result
    }
}

}
