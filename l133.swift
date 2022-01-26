//https://leetcode.com/problems/clone-graph/submissions/
//BFS
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        var queue = [Node](), copied = [Int: Node]()
        queue.append(node)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if copied[node.val] == nil {
                copied[node.val] = Node(node.val)
            }

            for neighbor in (node.neighbors.compactMap {$0})  {
                    if let copiedNeighbor = copied[neighbor.val] {
                        copied[node.val]!.neighbors.append(copiedNeighbor)
                    } else {
                        let copiedNeighbor = Node(neighbor.val)
                        copied[node.val]!.neighbors.append(copiedNeighbor)
                        copied[neighbor.val] = copiedNeighbor
                        queue.append(neighbor)
                    }
            }
        }
        return copied[1]
    }
}

//DFS
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        var cloned = [Int: Node]()
        dfs(node, &cloned)
        return cloned[1]
    }

    func dfs(_ node: Node, _ cloned: inout [Int: Node]) {
        if cloned[node.val] != nil {
            return
        }
        cloned[node.val] = Node(node.val)
        for neighbor in node.neighbors where neighbor != nil {
            dfs(neighbor!, &cloned)
            cloned[node.val]!.neighbors.append(cloned[neighbor!.val])
        }
    }
}