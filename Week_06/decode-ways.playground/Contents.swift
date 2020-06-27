import UIKit

//91. 解码方法
//一条包含字母 A-Z 的消息通过以下方式进行了编码：
//
//'A' -> 1
//'B' -> 2
//...
//'Z' -> 26
//给定一个只包含数字的非空字符串，请计算解码方法的总数。
//
//示例 1:
//输入: "12"
//输出: 2
//解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
//
//示例 2:
//输入: "226"
//输出: 3
//解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。


// ****************** 解法一  自己的动态规划解法 *******************//
/// 一道简单的动态规划题，做了好长时间，调整各种边界值
/// 大概的思路，能想到，但是一到细节的地方，就要剋好久，提交错了5次，每次根据测试用例想问题出在了哪里？
/// 哪里想错了。确实挺磨人
/// 边界情况：
/// 1.字符串是否是一个有效的编码串：只包含 0-9的字符，不包含其他的字符。
///   如果是第一个字符，只要在1-9 即有效；
///   如果是中间字符，中间字符的值可以为0-9，不是即无效；当前字符为0，如果不能和前一字符合并时，整个串就不是一个有效的编码，解法为0。
/// 2. dp[0] dp[1]如何定义 ?  dp[0]好定义，字符在 1-9之间 即为有效，并且只有1种解法
///
class Solution {
    func numDecodings(_ s: String) -> Int {
        let cnt: Int = s.count
        if cnt == 0 { return 0 }
        let schars: [Character] = s.map { $0 }
        var dp: [Int] = Array.init(repeating: 0, count: cnt+1)
        dp[0] = 1
        for i in 0..<cnt {
            if i == 0 {
                if schars[i] <= "9" && schars[i] > "1" {
                    dp[i+1] = 1
                } else {
                    return 0
                }
            } else {
                if (schars[i-1] == "1" && schars[i] >= "0" && schars[i] <= "9") || (schars[i-1] == "2" && schars[i] >= "0" && schars[i] <= "6") {
                    if schars[i] == "0" {
                        dp[i+1] = dp[i-1]
                    } else {
                        dp[i+1] = dp[i-1] + dp[i]
                    }
                } else if schars[i] >= "1" && schars[i] <= "9" {
                    dp[i+1] = dp[i]
                } else {
                    return 0
                }
            }
        }
        return dp[cnt]
    }
}

let solu = Solution()
let result = solu.numDecodings("226")
print(result)

