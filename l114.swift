//https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
class Solution {
    func flatten(_ root: TreeNode?) {
        var stk = [TreeNode]()
        var tail:TreeNode? = TreeNode(), cur = root
        while cur != nil || !stk.isEmpty {
            if cur != nil {
                tail?.right = cur
                tail = tail?.right
                let next = cur?.left
                cur?.left = nil

                if let right = cur?.right {
                    stk.append(right)
                    cur?.right = nil
                }

                cur = next
            } else {
                cur = stk.removeLast()
            }

        }
        return
    }
}