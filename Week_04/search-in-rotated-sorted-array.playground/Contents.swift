import UIKit

//33. 搜索旋转排序数组
//假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
//你可以假设数组中不存在重复的元素。
//你的算法时间复杂度必须是 O(log n) 级别。
//
//示例 1:
//输入: nums = [4,5,6,7,0,1,2], target = 0
//输出: 4
//
//示例 2:
//输入: nums = [4,5,6,7,0,1,2], target = 3
//输出: -1

// ***************************** 解法一 ******************************* //
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let count: Int = nums.count
        
        var l: Int = 0
        var r: Int = count - 1
        while l <= r {
            let mid: Int = (l + r)/2
            if nums[mid] == target {
                return mid
            }
            if nums[l] == target {
                return l
            } else if nums[r] == target {
                return r
            }

            if nums[l] > nums[r] && nums[mid] > nums[l] && target < nums[l] {
                l = mid + 1
            } else if nums[l] > nums[r] && nums[mid] < nums[l] && target > nums[l] {
                r = mid - 1
            } else {
                if nums[mid] > target {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }

        return -1
    }
}
let solu = Solution()
let result = solu.search([4,5,6,7,0,1,2], 3)
print(result)
