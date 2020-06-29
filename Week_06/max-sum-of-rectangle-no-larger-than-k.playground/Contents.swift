import UIKit


//363. 矩形区域不超过 K 的最大数值和
//给定一个非空二维矩阵 matrix 和一个整数 k，找到这个矩阵内部不大于 k 的最大矩形和。
//
//示例:
//
//输入: matrix = [[1,0,1],[0,-2,3]], k = 2
//输出: 2
//解释: 矩形区域 [[0, 1], [-2, 3]] 的数值和是 2，且 2 是不超过 k 的最大数字（k = 2）。
//说明：
//
//矩阵内的矩形区域面积必须大于 0。
//如果行数远大于列数，你将如何解答呢？


// ************************** 解法一 ************************ //
/// 双指针法
class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let row: Int = matrix.count
        if row == 0 { return 0 }
        let col: Int = matrix[0].count
        
        var maxsum: Int = Int.min
        for l in 0..<col {
            var dp: [Int] = Array(repeating: 0, count: row)
            for r in l..<col {
                for i in 0..<row {
                    dp[i] += matrix[i][r]
                }
                
                maxsum = max(maxsum, judgeMaxSum(dp, k))
            }
        }
        return maxsum
    }
    
    private func judgeMaxSum(_ sums: [Int], _ k: Int) -> Int {
        let row: Int = sums.count
        if row == 0 { return 0 }
        var maxsum: Int = Int.min
        for l in 0..<row {
            var sum: Int = 0
            for r in l..<row {
                sum += sums[r]
                if sum <= k && sum > maxsum {
                    maxsum = sum
                }
            }
        }
        
        return maxsum
    }
}
let solu = Solution()
let result = solu.maxSumSubmatrix([[1,0,1],[0,-2,3]], 2)
//let result = solu.maxSumSubmatrix([[2,2,-1]], 0)
print(result)
