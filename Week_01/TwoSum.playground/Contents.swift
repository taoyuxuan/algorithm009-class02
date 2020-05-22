import UIKit

//1. 两数之和
//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//
//示例:
//给定 nums = [2, 7, 11, 15], target = 9
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]


// **************************** 解法一 一遍hash表法 *************************** //
/// 就看上这个方法了

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        
        for (i,val) in nums.enumerated() {
            let sub = target - val
            if let idx = map[sub] {
                return [i, idx]
            } else {
                map[val] = i
            }
        }
        
        return []
    }
}

let solu = Solution()
let result = solu.twoSum([2, 7, 11, 15], 9)
print(result)
