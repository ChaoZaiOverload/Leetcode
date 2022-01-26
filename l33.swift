//Search in Rotated Sorted Array
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        return searchWorker(nums, 0, nums.count-1, target)
    }

    func searchWorker(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        while start <= end {
            let mid = (start + end) / 2
            if nums[start] == target {
                return start
            }
            if nums[end] == target {
                return end
            }
            if nums[mid] == target {
                return mid
            }
            if nums[start] < nums[mid] {
                if nums[start] < target && target < nums[mid] {
                    return searchWorker(nums, start+1, mid-1, target)
                } else {
                    return searchWorker(nums, mid+1, end-1, target)
                }
            } else if nums[start] > nums[mid] {
                if target > nums[start] || target < nums[mid] {
                    return searchWorker(nums, start+1, mid-1, target)
                } else {
                    return searchWorker(nums, mid+1, end-1, target)
                }
            } else {
                return searchWorker(nums, mid+1, end-1, target)
            }

        }

        return -1
    }
}