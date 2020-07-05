import UIKit

//312. 戳气球
//有 n 个气球，编号为0 到 n-1，每个气球上都标有一个数字，这些数字存在数组 nums 中。
//
//现在要求你戳破所有的气球。每当你戳破一个气球 i 时，你可以获得 nums[left] * nums[i] * nums[right] 个硬币。 这里的 left 和 right 代表和 i 相邻的两个气球的序号。注意当你戳破了气球 i 后，气球 left 和气球 right 就变成了相邻的气球。
//
//求所能获得硬币的最大数量。
//
//说明:
//
//你可以假设 nums[-1] = nums[n] = 1，但注意它们不是真实存在的所以并不能被戳破。
//0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100
//示例:
//
//输入: [3,1,5,8]
//输出: 167
//解释: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
//     coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167


// ************************** 解法一 动态规划 ******************************//
/// 自顶向下
class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let cnt: Int = nums.count
        let realcnt: Int = cnt + 2
        var newnums: [Int] = Array(repeating: 1, count: realcnt)
        for i in 0..<cnt {
            newnums[i+1] = nums[i]
        }
        
        var memo:[[Int]] = []
        
        return dp(memo, newnums, 0, cnt-1)
    }
    
    private func dp(_ memo: [[Int]], _ nums: [Int], _ left: Int, _ right: Int) -> Int {
        if left + 1 == right { return 0 }
        if memo[left][right] > 0 { return memo[left][right] }
        var ans: Int = 0
        for i in (left+1)..<right {
            ans = max(ans, nums[left]*nums[i]*nums[right]) + dp(memo, nums, left, i) + dp(memo, nums, i, right)
        }
        memo[left][right] = ans
        return ans
    }
}






