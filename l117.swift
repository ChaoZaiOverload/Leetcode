//https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/submissions/
class Solution {
    func connect(_ root: Node?) -> Node? {
        var levelHead = root
        while levelHead != nil {
            var nextLevelCur: Node? = nil, cur = levelHead
            levelHead = nil
            while cur != nil  {
                let pre = nextLevelCur
                if let left = cur?.left {
                    nextLevelCur?.next = left
                    nextLevelCur = left
                }
                if let right = cur?.right {
                    nextLevelCur?.next = right
                    nextLevelCur = right
                }
                if pre == nil && nextLevelCur != nil {
                    levelHead = cur?.left ?? cur?.right
                }

                cur = cur?.next
            }
        }
        return root
    }
}