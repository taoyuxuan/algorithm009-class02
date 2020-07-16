import UIKit

//300. 最长上升子序列
//给定一个无序的整数数组，找到其中最长上升子序列的长度。
//
//示例:
//
//输入: [10,9,2,5,3,7,101,18]
//输出: 4
//解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
//说明:
//
//可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
//你算法的时间复杂度应该为 O(n2) 。
//进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?


// ************** 解法一 动态规划 *******************//
class Solution {
    func lengthOfLIS(_ nums:[Int]) -> Int {
        let cnt: Int = nums.count
        var dp: [Int] = Array(repeating: 1, count: cnt)
        var maxlen: Int = 1
        for i in 1..<cnt {
            var curmaxlen: Int = 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    curmaxlen = max(curmaxlen, dp[j]+1)
                }
            }
            maxlen = max(maxlen, curmaxlen)
            dp[i] = curmaxlen
        }
        return maxlen
    }
}
let solu = Solution()
let result = solu.lengthOfLIS([10,9,2,5,3,7,101,18])
print(result)


// ************** 解法二 贪心+二分 *******************//
class Solution2 {
    func lengthOfLIS(_ nums:[Int]) -> Int {
        let cnt: Int = nums.count
        if cnt == 0 { return 0 }
        var dp: [Int] = Array(repeating: 0, count: cnt+1)
        var len: Int = 1
        dp[len] = nums[0]
        
        for i in 1..<cnt {
            if nums[i] > dp[len] {
                len += 1
                dp[len] = nums[i]
            } else {
                var l: Int = 1
                var r: Int = len
                var pos: Int = 0
                while l <= r {
                    let mid: Int = (l+r)>>1
                    if dp[mid] < nums[i] {
                        pos = mid
                        l = mid+1
                    } else {
                        r = mid-1
                    }
                }
                dp[pos+1] = nums[i]
            }
        }
        
        return len
    }
}
let solu2 = Solution2()
let result2 = solu2.lengthOfLIS([10,9,2,5,3,7,101,18])
print(result2)












