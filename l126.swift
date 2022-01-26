//https://leetcode.com/problems/word-ladder-ii/
class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var visited = [String: [[String]]](), queue = [String](), diffOne = [String: Set<String>](), shortestLen: Int?
        for w in wordList {
            for i in 0..<w.count {
                let tmp = w[0..<i] + "*" + w[(i+1)...]
                diffOne[tmp, default: []].insert(w)
            }
        }
        queue.append(beginWord)
        visited[beginWord] = [[beginWord]]
        while !queue.isEmpty {
            let w = queue.removeFirst()
            if w == endWord {
                return visited[w, default: []]
            }
            if shortestLen == visited[w]!.first!.count {
                continue
            }
            for i in 0..<w.count {
                let tmp = w[0..<i] + "*" + w[(i+1)...]
                for next in diffOne[tmp, default: []] {
                    if shortestLen == nil && next == endWord {
                        shortestLen = visited[w]!.first!.count + 1
                    }
                    let paths = visited[w]!.map { $0 + [next] }
                    if let seq = visited[next], seq.first!.count == paths.first!.count  {
                        visited[next]!.append(contentsOf: paths)
                    } else if nil == visited[next] {
                        queue.append(next)
                        visited[next] = paths
                    }
                }
            }
        }
        return []
    }
}