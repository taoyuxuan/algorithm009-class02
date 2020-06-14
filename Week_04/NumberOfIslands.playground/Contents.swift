import UIKit

//200. 岛屿数量
//给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
//岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。
//此外，你可以假设该网格的四条边均被水包围。
//
//示例 1:
//输入:
//11110
//11010
//11000
//00000
//输出: 1
//
//示例 2:
//输入:
//11000
//11000
//00100
//00011
//输出: 3
//解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。

// *************************** 解法一 DFS *************************** //
class Solution {
    var row: Int = 0
    var column: Int = 0
    var src: [[Character]] = []
    func numIslands(_ grid: [[Character]]) -> Int {
        src = grid
        let count = src.count
        guard count > 0 else { return 0 }
        row = count
        column = grid[0].count
        
        var ans: Int = 0
        for i in 0..<row {
            for j in 0..<column {
                if src[i][j] == "1" {
                    ans += 1
                    dfsMark(i, j)
                }
            }
        }
        
        return ans
    }
    func dfsMark(_ r: Int, _ c:Int) {
        guard r >= 0 && r < row && c >= 0 && c < column && src[r][c] == "1" else {
            return
        }
        
        src[r][c] = "0"
        dfsMark(r-1, c)
        dfsMark(r+1, c)
        dfsMark(r, c-1)
        dfsMark(r, c+1)
    }
}
let solu = Solution()
let result = solu.numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]])
print(result)
