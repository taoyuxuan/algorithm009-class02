import UIKit

//77. 组合
//给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
//
//示例:
//输入: n = 4, k = 2
//输出:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]

// *************************** 解法一 递归 回溯************************* //
/// 经典递归回溯题
/// 终止条件是 当前数组元素数为2 或者访问到最后一个元素
class Solution {
    
    var ans: [[Int]] = []
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        dfs(n, 1, k, [])
        return ans
    }
    
    func dfs(_ n: Int, _ i: Int, _ k: Int, _ item: [Int]) {
        // 终止条件
        if i > n || item.count > k || (n+1-i) < (k-item.count) {
            return;
        }
        
        // 处理子问题 并下探到下一层
        // 不选择当前数
        dfs(n, i+1, k, item)
        
        // 选择当前数
        var nitem = Array(item)
        nitem.append(i)
        if nitem.count == k {
            ans.append(nitem)
        }
        dfs(n, i+1, k, nitem)
    }
}

let solu = Solution()
let result = solu.combine(4, 2)
print(result)
