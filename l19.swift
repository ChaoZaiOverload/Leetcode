//remove-nth-node-from-end-of-list
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var second: ListNode? = dummy, first = head, steps = 0
        while first != nil && first?.next != nil {
            steps = steps + 1
            first = first?.next
            if steps >= n {
                second = second?.next
            }
        }
        if second?.next === head {
            return head?.next
        }
        second?.next = second?.next?.next
        return head
    }
}