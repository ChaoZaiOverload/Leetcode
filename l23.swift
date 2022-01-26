//https://leetcode.com/problems/merge-k-sorted-lists/
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let len = lists.count
        if len == 0 {
            return nil
        }
        if len == 1 {
            return lists[0]
        }
        let left = mergeKLists(Array(lists[0..<len/2]))
        let right = mergeKLists(Array(lists[(len/2)...]))
        return mergeTwo(left, right)
    }

    func mergeTwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummyHead = ListNode(), cur:ListNode? = dummyHead
        var c1 = l1, c2 = l2
        while c1 != nil || c2 != nil {
            if let v1 = c1?.val, let v2 = c2?.val {
                if v1 > v2 {
                    cur?.next = ListNode(v2)
                    c2 = c2?.next
                } else {
                    cur?.next = ListNode(v1)
                    c1 = c1?.next
                }
            } else if let v1 = c1?.val {
                cur?.next = ListNode(v1)
                c1 = c1?.next
            } else if let v2 = c2?.val {
                cur?.next = ListNode(v2)
                c2 = c2?.next
            }
            cur = cur?.next
        }
        return dummyHead.next
    }
}