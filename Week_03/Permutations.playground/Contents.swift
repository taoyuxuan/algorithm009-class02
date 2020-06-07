import UIKit

//46. 全排列
//给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//
//示例:
//输入: [1,2,3]
//输出:
//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]


// ******************************* 解法一 ********************************//
/// 递归 + 回溯
class Solution {
    var ans: [[Int]] = []
    func permute(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count == 0 {
            return ans
        }
        
        backtrace(nums, [], [:])
        return ans
    }
    
    
    func backtrace(_ nums: [Int], _ item: [Int], _ usedMap: [Int: Bool]) {
        let count: Int = nums.count
        if item.count == count {
            ans.append(item)
        }
        for i in 0..<count {
            if let used = usedMap[i], used { } else {
                // 如果没有添加，再处理接下来添加逻辑
                var nitem: [Int] = item
                nitem.append(nums[i])
                var nusedMap: [Int: Bool] = usedMap
                nusedMap[i] = true
                
                backtrace(nums, nitem, nusedMap)
            }
        }
    }
}
let solu = Solution()
let result = solu.permute([1,2,3])
print(result)
