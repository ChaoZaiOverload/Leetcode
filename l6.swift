//zigzag-conversion
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 0 {
            return ""
        }
        if numRows == 1 {
            return s
        }
        var arr = Array(repeating: "", count: numRows)
        var row = 0, dir = 1
        for i in 0..<s.count {
            arr[row].append(s[i])
            if row == numRows - 1 {
                dir = -1
            }
            if row == 0 {
                dir = 1
            }
            row = row + dir
        }
        var ans = ""
        return arr.reduce(into: ans) { result, s in
            result.append(s)
        }
    }
}
