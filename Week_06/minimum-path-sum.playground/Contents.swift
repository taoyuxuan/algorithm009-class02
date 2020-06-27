import UIKit

//64. 最小路径和
//给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
//说明：每次只能向下或者向右移动一步。
//
//示例:
//输入:
//[
//  [1,3,1],
//  [1,5,1],
//  [4,2,1]
//]
//输出: 7
//解释: 因为路径 1→3→1→1→1 的总和最小。

// ****************************** 解法一 一维动态规划 ********************************//

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let row: Int = grid.count
        if row == 0 { return 0 }
        let col: Int = grid[0].count
        
        var dp:[Int] = Array.init(repeating: 0, count: col)
        for i in 0..<row {
            for j in 0..<col {
                if i == 0 && j == 0 {
                    dp[j] = grid[0][0]
                } else if i == 0 {
                    dp[j] = dp[j-1] + grid[i][j]
                } else if j == 0 {
                    dp[j] = dp[i] + grid[i][j]
                } else {
                    dp[j] = min(dp[j-1], dp[j]) + grid[i][j]
                }
            }
        }
        
        return dp[col-1]
    }
}
let solu = Solution()
let result = solu.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
print(result)

