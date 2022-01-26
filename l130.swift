//https://leetcode.com/problems/surrounded-regions/submissions/
class Solution {
    func solve(_ board: inout [[Character]]) {
        let n = board.count, m = n > 0 ? board[0].count : 0
        if n == 0 || m == 0 {
            return
        }

        for i in 0..<n {
                if board[i][0] == "O" {
                    dfs(i,0,&board)
                }
                if board[i][m-1] == "O" {
                    dfs(i,m-1,&board)
                }
        }
        for j in 0..<m {
            if board[0][j] == "O" {
                dfs(0,j,&board)
            }
            if board[n-1][j] == "O" {
                dfs(n-1,j,&board)
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "Y" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }

    func dfs(_ i: Int, _ j: Int, _ board: inout [[Character]]) {
        if i < 0 || i > board.count-1 || j < 0 || j > board[0].count-1 || board[i][j] == "X" || board[i][j] == "Y" {
            return
        }
        board[i][j] = "Y"
        for d in [[0,1], [0,-1], [-1,0], [1,0]] {
            dfs(i+d[0],j+d[1],&board)
        }
    }
}