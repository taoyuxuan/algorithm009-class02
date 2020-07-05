import UIKit

//130. 被围绕的区域
//给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
//
//找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
//
//示例:
//
//X X X X
//X O O X
//X X O X
//X O X X
//运行你的函数后，矩阵变为：
//
//X X X X
//X X X X
//X X X X
//X O X X
//解释:
//
//被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。


// ************************** 解法一 *********************** //
class Solution {
    func solve(_ board: inout [[Character]]) {
        let row: Int = board.count
        if row == 0 { return }
        let col: Int = board[0].count
        
        for i in 0..<row {
            for j in 0..<col {
                let isEdge: Bool = (i == 0 || j == 0 || i == row-1 || j == col-1)
                if isEdge && board[i][j] == "O" {
                    dfs(&board, i, j)
                }
            }
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                if board[i][j] == "#" {
                    board[i][j] = "O"
                }
            }
        }
    }
    
    private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        let row: Int = board.count
        if row == 0 { return }
        let col: Int = board[0].count
        
        if i < 0 || j < 0 || i >= row || j >= col || board[i][j] == "X" || board[i][j] == "#" {
            return
        }
        board[i][j] = "#"
        dfs(&board, i-1, j)
        dfs(&board, i+1, j)
        dfs(&board, i, j-1)
        dfs(&board, i, j+1)
    }
}
var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
let solu = Solution()
solu.solve(&board)
print(board)
