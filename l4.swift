//median-of-two-sorted-arrays
class Solution {
    func findKthMin(_ array1: [Int], _ array2: [Int], _ k: Int) -> Int {

        var s1 = array1, s2 = array2
        if s1.count > s2.count {
            let tmp = s1
            s1 = s2
            s2 = tmp
        }

        if s1.count == 0 {
            return s2[k-1]
        }

        if k == 1 {
            return min(s1[0], s2[0])
        }

        let p1 = min(k/2,s1.count), p2 = k-p1
        if s1[p1-1] < s2[p2-1] {
            return findKthMin(Array(s1[p1...]), s2, k-p1)
        } else if s1[p1-1] > s2[p2-1] {
            return findKthMin(s1, Array(s2[p2...]), k-p2)
        } else {
            return s1[p1-1]
        }

    }
    func findMedianSortedArrays(_ s1: [Int], _ s2: [Int]) -> Double {
        if (s1.count + s2.count) % 2 == 0 {
            return Double(findKthMin(s1, s2, (s1.count + s2.count)/2) + findKthMin(s1, s2, (s1.count + s2.count )/2 + 1) )/2.0
        } else {
            return Double(findKthMin(s1, s2, (s1.count + s2.count+1)/2))
        }
    }
}