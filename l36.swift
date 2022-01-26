//https://leetcode.com/problems/valid-sudoku/submissions/
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var column = Set<Character>(), row = Set<Character>(), box = Set<Character>()
        let len = board.count
        for i in 0..<len {
            for j in 0..<len {
                if board[i][j] != "."  && row.contains(board[i][j]) {
                    return false
                }
                row.insert(board[i][j])

                if board[j][i] != "." && column.contains(board[j][i]) {
                    return false
                }
                column.insert(board[j][i])

                let r = 3*(i/3) + j/3
                let c = 3*(i%3) + j%3
                if board[r][c] != "." && box.contains(board[r][c]) {
                    return false
                }
                box.insert(board[r][c])
            }
            column = Set<Character>()
            row = Set<Character>()
            box = Set<Character>()
        }
        return true
    }
}