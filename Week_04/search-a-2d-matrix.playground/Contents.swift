import UIKit

//74. 搜索二维矩阵
//编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
//
//每行中的整数从左到右按升序排列。
//每行的第一个整数大于前一行的最后一个整数。
//
//示例 1:
//输入:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 3
//输出: true
//
//示例 2:
//输入:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 13
//输出: false

// ********************* 解法一 ************************//
/// 先确定行再确定列
/// 两次二分查找
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row: Int = matrix.count
        if row == 0 { return false }
        let column = matrix[0].count
        
        var l = 0
        var r = row - 1
        while l < r {
            let mid = (l+r)/2
            if matrix[mid][0] == target {
                return true
            } else if matrix[mid][0] > target {
                r = mid
            } else {
                if l == mid {
                    if matrix[r][0] == target {
                        return true
                    } else if matrix[r][0] < target {
                        l = r
                    }
                    break
                } else {
                    l = mid
                }
            }
        }
        
        var coll: Int = 0
        var colr: Int = column - 1
        while coll <= colr {
            let mid = (coll + colr) / 2
            if matrix[l][mid] == target {
                return true
            } else if matrix[l][mid] > target {
                colr = mid - 1
            } else {
                coll = mid + 1
            }
        }
        
        return true
    }
}
let solu = Solution()
//let result = solu.searchMatrix([[1,   3,  5,  7],[10, 11, 16, 20],[23, 30, 34, 50]], 3)
let result = solu.searchMatrix([[1],[3]], 3)
print(result)


// ******************************* 解法二 *********************************** //
/// 整体二分查找
class Solution2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        if row == 0 { return false }
        let column = matrix[0].count
        
        var left: Int = 0
        var right = row * column - 1
        var mid: Int = 0
        var midElem: Int = 0
        while left <= right {
            mid = (left + right) / 2
            midElem = matrix[mid/column][mid%column]
            if target == midElem {
                return true
            } else if target < midElem {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return false
    }
}
let solu2 = Solution2()
let result2 = solu2.searchMatrix([[1],[3]], 3)
print(result2)
