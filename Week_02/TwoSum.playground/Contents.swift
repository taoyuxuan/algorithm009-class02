import UIKit

//1. 两数之和
//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//
//示例:
//给定 nums = [2, 7, 11, 15], target = 9
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]

// ***************************** 解法一 一遍hash表 ***************************** //
/// 时间复杂度 O(n) 空间复杂度 O(n)
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dicts: [Int: Int] = [:]
        
        for (i, val) in nums.enumerated() {
            let sub = target - val
            if let idx = dicts[sub] {
                return [idx, i]
            } else {
                dicts[val] = i
            }
        }
        
        return []
    }
}
let solu = Solution()
let result = solu.twoSum([2, 7, 11, 15], 9)
print(result)

// ***************************** 解法二 双指针法 ***************************** //
/// 首先排序，将数据从小到大排序，然后根据左右指针指向的数之和打大小左右移动，直到找到和为target的值
class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let soredNum: [Int] = nums.sorted { $0 < $1 }
        var l: Int = 0
        var r: Int = nums.count-1
        while l < r {
            let leftN = soredNum[l]
            let rightN = soredNum[r]
            if leftN + rightN > target {
                r -= 1
            } else if leftN + rightN < target {
                l += 1
            } else {
                return [l, r]
            }
        }
        return []
    }
}
let solu2 = Solution2()
let result2 = solu2.twoSum([2, 7, 11, 15], 9)
print(result2)
