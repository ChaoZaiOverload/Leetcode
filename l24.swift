//https://leetcode.com/problems/swap-nodes-in-pairs/submissions/
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head
        if head?.next == nil {
            return head
        }
        var first = head, second = head?.next, pre: ListNode? = dummy
        while first != nil && second != nil {
            pre?.next = second
            first?.next = second?.next
            second?.next = first
            pre = first
            first = first?.next
            second = first?.next
        }
        return dummy.next
    }
}