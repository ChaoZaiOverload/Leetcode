//https://leetcode.com/problems/merge-two-sorted-lists/submissions/
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var cur: ListNode? = dummy
        var l1 = l1, l2 = l2
        while l1 != nil || l2 != nil {
            if let v1 = l1?.val, let v2 = l2?.val {
                if v1 < v2 {
                    cur?.next = ListNode(v1)
                    l1 = l1?.next
                } else {
                    cur?.next = ListNode(v2)
                    l2 = l2?.next
                }
            } else if let v1 = l1?.val {
                cur?.next = ListNode(v1)
                l1 = l1?.next
            } else if let v2 = l2?.val {
                cur?.next = ListNode(v2)
                l2 = l2?.next
            }
            cur = cur?.next
        }
        return dummy.next
    }
}