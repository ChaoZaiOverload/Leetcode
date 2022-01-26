class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var dp = Array(repeating: [TreeNode?](), count: 1+n)
        dp[0] = [nil]
        if n < 1 {
            return []//test case err
        }
        for i in 1...n {
            for left in 0...i-1 {
                for lt in dp[left] {
                    for rt in dp[i-1-left] {
                        let root = TreeNode(left+1)
                        root.left = formTree(lt, 0)
                        root.right = formTree(rt, left+1)
                        dp[i].append(root)
                    }
                }
            }
        }
        return dp[n]
    }

    func formTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
             return nil
        }
        let newRoot = TreeNode(root.val + val)
        newRoot.left = formTree(root.left, val)
        newRoot.right = formTree(root.right, val)

        return newRoot
    }
}