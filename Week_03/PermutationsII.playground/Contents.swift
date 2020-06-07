import UIKit

//47. 全排列 II
//给定一个可包含重复数字的序列，返回所有不重复的全排列。
//
//示例:
//
//输入: [1,1,2]
//输出:
//[
//  [1,1,2],
//  [1,2,1],
//  [2,1,1]
//]


// ***************************** 解法一 排序+递归+回溯 *****************************//
class Solution {
    var ans: [[Int]] = []
    var elemCnt: [Int: Int] = [:]
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count == 0 {
            return ans
        }
        
        // 1.计算每个元素的个数
        for val in nums {
            if let cnt = elemCnt[val] {
                elemCnt[val] = cnt + 1
            } else {
                elemCnt[val] = 1
            }
        }
        
        // 2.排序
        let sourceNums: [Int] = nums.sorted()
        
        // 3.开始排列
        dfs(sourceNums, [], [:])
        return ans
    }
    
    func dfs(_ nums: [Int], _ item: [Int], _ usedMap: [Int: Int]) {
        let count = nums.count
        if count == item.count {
            ans.append(item)
            return
        }
        
        for (i, val) in nums.enumerated() {
            if i > 0, val == nums[i-1] {
                continue
            }
            
            var tcnt: Int = 0
            var cnt: Int = 0
            if let tmpcnt = elemCnt[val] {
                tcnt = tmpcnt
            }
            if let tmpcnt = usedMap[val] {
                cnt = tmpcnt
            }
            if tcnt > cnt { // 还有数可以添加
                var nitem: [Int] = item
                nitem.append(val)
                var nusedmap: [Int: Int] = usedMap
                nusedmap[val] = cnt + 1
                dfs(nums, nitem, nusedmap)
            }
        }
    }
}
let solu = Solution()
let result = solu.permuteUnique([1,1,2])
print(result)
