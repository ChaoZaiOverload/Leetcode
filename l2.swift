// Add Two Numbers
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode()
        var ans: ListNode = dummyHead
        var carry = 0
        var c1 = l1, c2 = l2
        while c1 != nil || c2 != nil {
            let c1Val = c1?.val ?? 0
            let c2Val = c2?.val ?? 0
            ans.next =  ListNode((c1Val + c2Val + carry) % 10)
            ans = ans.next!
            carry = (c1Val + c2Val + carry) / 10
            c1 = c1?.next
            c2 = c2?.next
        }
        if carry > 0 {
            ans.next = ListNode(carry)
        }
        return dummyHead.next
    }
}