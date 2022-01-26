//https://leetcode.com/problems/insert-interval/
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count == 0 {
            return [newInterval]
        }
        var left = 0, right = intervals.count-1
        while left <= right {
            let mid = (left+right)/2
            let res = compare(intervals[mid], newInterval)
            if res == -1 {
                left = mid + 1
            } else if res == 1 {
                right = mid - 1
            } else {
                right = mid - 1
            }
        }

        var start = right < 0 ? 0 : right
        if start < intervals.count-1 &&
        compare(intervals[start], newInterval) == -1 &&
        compare(intervals[start+1], newInterval)  == 0 {
            start = start + 1
        }

        left = 0
        right = intervals.count - 1
        while left <= right {
            let mid = (left+right)/2
            let res = compare(intervals[mid], newInterval)
            if res == -1 {
                left = mid + 1
            } else if res == 1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        var end = left >= intervals.count ? intervals.count - 1 : left
        if end > 0 && compare(intervals[end-1], newInterval) == 0 &&
        compare(intervals[end], newInterval)  == 1 {
            end = end - 1
        }

        let res: [[Int]] = merge([intervals[start], newInterval, intervals[end]])
        let ans = intervals[0..<start] + res[0...] + intervals[(end+1)...]
        return Array(ans)
    }

    func compare(_ i1: [Int], _ i2: [Int]) -> Int {
        if (i1[0] <= i2[0] && i2[0] <= i1[1]) ||
        (i2[0] <= i1[0] && i1[0] <= i2[1]) {
            return 0
        } else if i1[1] < i2[0] {
            return -1
        } else {
            return 1
        }
    }

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        if intervals.count == 0 {
            return result
        }
        let sortedIntervals = intervals.sorted {$0[0] < $1[0]}
        result.append(sortedIntervals.first!)
        for index in 1..<sortedIntervals.count {
            let prevStart = result.last![0]
            let prevEnd = result.last![1]
            let currStart = sortedIntervals[index][0]
            let currEnd = sortedIntervals[index][1]
            if prevEnd >= currStart && prevEnd <= currEnd {
                let newEntry = [prevStart, currEnd]
                result.removeLast()
                result.append(newEntry)
            } else if prevEnd < currEnd {
                let newEntry = [currStart, currEnd]
                result.append(newEntry)
            }
        }
        return result
    }
}