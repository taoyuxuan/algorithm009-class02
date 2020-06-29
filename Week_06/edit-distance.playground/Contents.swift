import UIKit

//72. 编辑距离
//给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。
//
//你可以对一个单词进行如下三种操作：
//插入一个字符
//删除一个字符
//替换一个字符
//
//
//示例 1：
//输入：word1 = "horse", word2 = "ros"
//输出：3
//解释：
//horse -> rorse (将 'h' 替换为 'r')
//rorse -> rose (删除 'r')
//rose -> ros (删除 'e')
//
//示例 2：
//输入：word1 = "intention", word2 = "execution"
//输出：5
//解释：
//intention -> inention (删除 't')
//inention -> enention (将 'i' 替换为 'e')
//enention -> exention (将 'n' 替换为 'x')
//exention -> exection (将 'n' 替换为 'c')
//exection -> execution (插入 'u')


// ********************** 解法一 动态规划 *************************//
/// 这里想不到dp是如何定义的
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == word2 { return 0 }
        let cnt1: Int = word1.count
        let cnt2: Int = word2.count
        if cnt1 == 0 { return cnt2 }
        if cnt2 == 0 { return cnt1 }
        
        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: cnt2+1), count: cnt1+1)
        let chars1: [Character] = word1.map { $0 }
        let chars2: [Character] = word2.map { $0 }
        for i in 0...cnt1 {
            for j in 0...cnt2 {
                if i == 0 && j == 0 { dp[i][j] = 0}
                else if i == 0 { dp[i][j] = j }
                else if j == 0 { dp[i][j] = i }
                else {
                    if chars1[i-1] == chars2[j-1] {
                        // 相等的话，
                        dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]-1)
                    } else {
                        dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                    }
                }
            }
        }
        return dp[cnt1][cnt2]
    }
}
let solu = Solution()
let result = solu.minDistance("intention", "execution")
print(result)
