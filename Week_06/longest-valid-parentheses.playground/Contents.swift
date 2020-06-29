import UIKit

//32. 最长有效括号
//给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
//
//示例 1:
//输入: "(()"
//输出: 2
//解释: 最长有效括号子串为 "()"
//
//示例 2:
//输入: ")()())"
//输出: 4
//解释: 最长有效括号子串为 "()()"

// ************************ 解法一 动态规划 ************************ //
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let cnt: Int = s.count
        
        let schars: [Character] = s.map { $0 }
        
        var ans: Int = 0
        var dp: [Int] = Array(repeating: 0, count: cnt)
        for i in 1..<cnt {
            if schars[i] == ")" {
                if schars[i-1] == "(" {
                    dp[i] = ((i > 2) ? dp[i-2] : 0) + 2
                } else if (i - dp[i-1] > 0 && schars[i-1-dp[i-1]] == "(") {
                    dp[i] = dp[i-1] + ((i-dp[i-1]) >= 2 ? dp[i-dp[i-2]-2] : 0) + 2
                }
                ans = max(ans, dp[i])
            }
        }
        
        return ans
    }
}
let solu = Solution()
let result = solu.longestValidParentheses("(())(()")
print(result)


// ************************ 解法一 栈 ************************ //
class Solution2 {
    func longestValidParentheses(_ s: String) -> Int {
        let cnt: Int = s.count
        var ans: Int = 0
        let schars: [Character] = s.map { $0 }
        
        var stack: [Int] = []
        stack.append(-1) // 哨兵吗
        for i in 0..<cnt {
            if schars[i] == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    ans = max(ans, i - stack[stack.count-1])
                }
            }
        }
        return ans
    }
}
let solu2 = Solution2()
let result2 = solu2.longestValidParentheses("(())(()")
print(result2)


// ************************ 解法一 双指针法 ************************ //
class Solution3 {
    func longestValidParentheses(_ s: String) -> Int {
        let cnt: Int = s.count
        if cnt == 0 { return 0 }
        
        let schars: [Character] = s.map { $0 }
        
        var maxCnt: Int = 0
        var ln: Int = 0
        var rn: Int = 0
        for i in 0..<cnt {
            if schars[i] == "(" {
                ln += 1
            } else {
                rn += 1
            }
            
            if ln == rn {
                maxCnt = max(maxCnt, rn*2)
            } else if rn > ln {
                ln = 0
                rn = 0
            }
        }
        
        ln = 0
        rn = 0
        for i in (0..<cnt).reversed() {
            if schars[i] == ")" {
                rn += 1
            } else {
                ln += 1
            }
            if ln == rn {
                maxCnt = max(maxCnt, ln*2)
            } else if ln > rn {
                ln = 0
                rn = 0
            }
        }
        
        return maxCnt
    }
}
let solu3 = Solution3()
let result3 = solu3.longestValidParentheses("(())(()")
print(result3)
