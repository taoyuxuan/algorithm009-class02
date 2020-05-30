import UIKit

//49. 丑数
//我们把只包含因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。
//
//示例:
//输入: n = 10
//输出: 12
//解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
//说明:
//1 是丑数。
//n 不超过1690。
//注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/


// ***************************** 解法一  动态规划 ************************ //
/// 说实话，还是没有头绪；一遇到动态规划就懵
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var a = 0
        var b = 0
        var c = 0
        var dp:[Int] = Array.init(repeating: 0, count: n)
        dp[0] = 1
        for i in 1..<n {
            let n2 = dp[a] * 2
            let n3 = dp[b] * 3
            let n5 = dp[c] * 5
            
            dp[i] = min(n2, min(n3, n5))
            if dp[i] == n2 {
                a += 1
            }
            if dp[i] == n3 {
                b += 1
            }
            if dp[i] == n5 {
                c += 1
            }
        }
        
        return dp[n-1]
    }
}
let solu = Solution()
let result = solu.nthUglyNumber(10)
print(result)
