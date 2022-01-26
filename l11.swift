//container-with-most-water
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count-1, area = 0
        while left < right {
            area = max(area, min(height[left], height[right]) * (right - left))
            if height[left] < height[right] {
                left = left + 1
            } else {
                right = right - 1
            }
        }
        return area
    }
}