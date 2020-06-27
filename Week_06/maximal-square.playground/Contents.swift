import UIKit

//221. 最大正方形
//在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
//
//示例:
//输入:
//1 0 1 0 0
//1 0 1 1 1
//1 1 1 1 1
//1 0 0 1 0
//输出: 4


// ************************** 解法一 暴力解法 ************************** //
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let row: Int = matrix.count
        if row == 0 { return 0 }
        let col: Int = matrix[0].count
        
        var maxDim: Int = 0
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == "1" {
                    maxDim = max(maxDim, 1)
                    let remX: Int = row - 1 - i
                    let remY: Int = col - 1 - j
                    if remX == 0 || remY == 0 {
                        maxDim = max(maxDim, 1)
                        break
                    }
                    for len in 1...min(remX, remY) {
                        var shouldBreak: Bool = false
                        if matrix[i+len][j+len] == "1" {
                            for k in 0..<len {
                                if matrix[i+k][j+len] == "1" && matrix[i+len][j+k] == "1" {} else {
                                    shouldBreak = true
                                }
                            }
                        } else {
                            shouldBreak = true
                        }
                        
                        if shouldBreak {
                            break
                        }
                        maxDim = max(maxDim, (len+1)*(len+1))
                    }
                }
            }
        }
        
        return maxDim
    }
}
let solu = Solution()
//let result = solu.maximalSquare([["0","0","0","0","0"],["1","0","0","0","0"],["0","0","0","0","0"],["0","0","0","0","0"]])
let result = solu.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])

print(result)


// **********************  解法二 动态规划 *************************** //
/// 关键记录当前元素的最大边长值
class Solution2 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let row: Int = matrix.count
        if row == 0 { return 0 }
        let col: Int = matrix[0].count
        if col == 0 { return 0 }
        
        var maxSize: Int = 0
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i-1][j], dp[i][j-1],dp[i-1][j-1]) + 1
                    }
                    maxSize = max(maxSize, dp[i][j])
                }
            }
        }
        
        return maxSize*maxSize
    }
}
let solu2 = Solution2()
//let result = solu.maximalSquare([["0","0","0","0","0"],["1","0","0","0","0"],["0","0","0","0","0"],["0","0","0","0","0"]])
let result2 = solu2.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])

print(result2)














