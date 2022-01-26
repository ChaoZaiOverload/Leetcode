//https://leetcode.com/problems/sum-root-to-leaf-numbers/
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var sum: Int = 0
        sumFrom(root, 0, &sum)
        return sum
    }

    func sumFrom(_ root: TreeNode, _ localSum: Int, _ sum: inout Int) {
        if isLeaf(root) {
            sum += root.val + localSum * 10
            return
        }
        if let left = root.left {
            sumFrom(left, localSum * 10 + root.val, &sum)
        }
        if let right = root.right {
            sumFrom(right, localSum * 10 + root.val, &sum)
        }
    }

    func isLeaf(_ node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
}