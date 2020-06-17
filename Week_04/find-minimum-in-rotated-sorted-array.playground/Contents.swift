import UIKit

//153. 寻找旋转排序数组中的最小值
//假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//
//( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//
//请找出其中最小的元素。
//
//你可以假设数组中不存在重复元素。
//
//示例 1:
//
//输入: [3,4,5,1,2]
//输出: 1
//示例 2:
//
//输入: [4,5,6,7,0,1,2]
//输出: 0


// ***************************** 解法一 二分法 **************************** //
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        let count = nums.count
        if nums[0] < nums[count-1] { return nums[0] }

        var l: Int = 0
        var r: Int = count - 1
        var pos: Int = 0
        while l < r {
            let mid: Int = (l + r)/2
            if mid > 0 && mid < count-1 && nums[mid] < nums[mid-1] && nums[mid] < nums[mid+1] {
                pos = mid
                break
            }
            
            if nums[l] > nums[r] {
                if nums[mid] >= nums[l] { l = mid + 1}
                else if nums[mid] <= nums[r] { r = mid - 1 }
            } else if nums[l] <= nums[r] {
                if nums[l] >= nums[0] { pos = r }
                else { pos = l }
                break
            }
        }
        if l == r { pos = l }
        return nums[pos]
    }
}
let solu = Solution()
let result = solu.findMin([4,5,6,7,0,1,2])
print(result)
