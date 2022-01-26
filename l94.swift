//https://leetcode.com/problems/binary-tree-inorder-traversal/
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stk = [TreeNode]()
        var nextRoot = root, ans = [Int]()

        while nextRoot != nil || !stk.isEmpty {
            while nextRoot != nil {
                stk.append(nextRoot!)
                nextRoot = nextRoot?.left
            }

            let top = stk.removeLast()
            ans.append(top.val)
            nextRoot = top.right
        }
        return ans
    }
}