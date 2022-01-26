//https://leetcode.com/problems/merge-sorted-array/submissions/
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 1  3 5,
        // 2 4
        var i = m-1, j = n-1, right = m+n-1
        while i >= 0 || j >= 0 {
            if i < 0 {
                nums1[right] = nums2[j]
                j -= 1
            } else if j < 0 {
                nums1[right] = nums1[i]
                i -= 1
            } else {
                if nums1[i] > nums2[j] {
                    nums1[right] = nums1[i]
                    i -= 1
                } else {
                    nums1[right] = nums2[j]
                    j -= 1
                }

            }
            right -= 1
        }
    }
}