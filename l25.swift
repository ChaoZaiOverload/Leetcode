//https://leetcode.com/problems/reverse-nodes-in-k-group/submissions/
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var cur = head, count = 0
        while cur != nil && count < k {
            cur = cur?.next
            count = count + 1
        }
        if k != count {
            return head
        }

        let head2 = reverseKGroup(cur, k)

        cur = head
        var pre: ListNode? = head2
        while count > 0 {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
            count -= 1
        }
        return pre
    }
}