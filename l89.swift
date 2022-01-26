//https://leetcode.com/problems/gray-code/submissions/

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        if n == 1  {
            return [0, 1]
        }
        var pre = [0,1]
        for i in 2...n {
            var cur = [Int]()
            for j in 0..<pre.count {
                cur.append(pre[j])
            }
            for j in (0..<pre.count).reversed() {
                cur.append(Int(pow(2.0, Double(i-1))) + pre[j])
            }
            pre = cur
        }
        return pre
    }
}