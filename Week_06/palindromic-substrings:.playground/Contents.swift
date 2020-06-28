import UIKit

//647. 回文子串
//给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
//
//具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
//
//示例 1:
//
//输入: "abc"
//输出: 3
//解释: 三个回文子串: "a", "b", "c".
//示例 2:
//
//输入: "aaa"
//输出: 6
//说明: 6个回文子串: "a", "a", "a", "aa", "aa", "aaa".
//注意:
//
//输入的字符串长度不会超过1000。

// *********************** 解法一  ************************ //
/// 中心扩散法
class Solution {
    func countSubstrings(_ s: String) -> Int {
        let cnt: Int = s.count
        var ans: Int = 0
        let schars: [Character] = s.map { $0 }
        for center in 0..<(2*cnt-1) {
            var left: Int = center/2
            var right: Int = left + center%2
            while left >= 0 && right < cnt && schars[left] == schars[right] {
                ans += 1
                left -= 1
                right += 1
            }
        }
        return ans
    }
}
let solu = Solution()
let result = solu.countSubstrings("aaa")
print(result)



// *********************** 解法二  ************************ //
/// 动态规划
class Solution2 {
    func countSubstrings(_ s: String) -> Int {
        if s == "" { return 0 }
        let cnt: Int = s.count
        var dp:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: cnt), count: cnt)
        
        for i in 0..<cnt {
            dp[i][i] = true
        }
        
        var ans: Int = cnt
        
        let schars: [Character] = s.map { $0 }
        for i in (0..<cnt).reversed() {
            for j in (i+1)..<cnt {
                if schars[i] == schars[j] {
                    if j-i == 1 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i+1][j-1]
                    }
                } else {
                    dp[i][j] = false
                }
                if dp[i][j] == true { ans += 1 }
            }
        }
        return ans
    }
}

let solu2 = Solution2()
let result2 = solu2.countSubstrings("aaa")
print(result2)





