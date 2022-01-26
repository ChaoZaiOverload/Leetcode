//https://leetcode.com/problems/binary-tree-maximum-path-sum/submissions/
class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = root!.val
        dfs(root, &ans)
        return ans
    }

    func dfs(_ node: TreeNode?, _ ans: inout Int) -> Int {
        var local = 0
        guard let node = node else {
            return local
        }
        local = node.val
        var localLeft = 0, localRight = 0
        if let left = node.left {
            localLeft = dfs(left, &ans)
        }
        if let right = node.right {
            localRight = dfs(right, &ans)
        }

        local = max(local, local + max(localLeft, localRight))
        ans = max(ans, max(local, node.val + localLeft + localRight))
        return local
    }
}