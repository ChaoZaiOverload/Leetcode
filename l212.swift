class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var board = board
        if board.count == 0 || board[0].count == 0 {
            return []
        }

        let root = TrieNode()
        words.forEach {
            insertWord(root, $0)
        }

        var result = Set<String>()
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                search(i, j, &board, root, &result)
            }
        }
        return Array(result)
    }

    func search(_ i: Int, _ j: Int, _ board: inout [[Character]], _ root: TrieNode, _ result: inout Set<String>) {
        if i < 0 || j < 0 || i > board.count - 1 || j > board[0].count - 1 || board[i][j] == "#" {
            return
        }
        let origin = board[i][j]
        board[i][j] = "#"
        if let child = root.children[origin] {
            if let w = child.word {
                result.insert(w)
            }
            for delta in [[0,1], [1,0], [-1,0], [0,-1]] {
                search(i+delta[0], j+delta[1], &board, child, &result)
            }
        }
        board[i][j] = origin
    }

    func insertWord(_ root: TrieNode,  _ word: String) {
        var node = root
        for c in word {
            if let child = node.children[c] {
                node = child
            } else {
                node.children[c] = TrieNode()
                node = node.children[c]!
            }
        }
        node.word = word
    }
}

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var word: String? = nil
}