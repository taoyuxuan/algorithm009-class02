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


// *********************** 动态规划 dp版 ************************** //
class Solution {
    func numDecodings(_ s: String) -> Int {
        let cnt: Int = s.count
        if cnt == 0 { return 0 }
        var dp: [Int] = Array(repeating: 0, count: cnt)
        
        var pre: Character = " "
        for (i, ch) in s.enumerated() {
            let tmppre = pre
            pre = ch
            if i == 0 && ch == "0" { return 0 }
            if i > 0 && ch == "0" && (tmppre > "2" || tmppre <= "0") {
                return 0
            }
            if i == 0 { dp[0] = 1; continue }
            if (tmppre == "1" || (tmppre == "2" && ch >= "0" && ch <= "6")) {
                if i == 1 {
                    if ch == "0" {
                        dp[1] = 1
                    } else {
                        dp[1] = 1 + dp[0]
                    }
                } else {
                    if ch == "0" {
                        dp[i] = dp[i-2]
                    } else {
                        dp[i] = dp[i-1] + dp[i-2]
                    }
                }
            } else {
                dp[i] = dp[i-1]
            }
        }
        
        return dp[cnt-1]
    }
}
let solu = Solution()
let result = solu.numDecodings("10")  // 1
//let result = solu.numDecodings("100") // 0
//let result = solu.numDecodings("2262012") // 6
//let result = solu.numDecodings("1") //1
//let result = solu.numDecodings("1267532") // 3
print(result)


// *********************** 动态规划 变量版 ************************** //
class Solution2 {
    func numDecodings(_ s: String) -> Int {
        let cnt: Int = s.count
        if cnt == 0 { return 0 }
        var pre1: Int = 1 // 第i个元素的前面第1个
        var pre2: Int = 1 // 第i个元素的前面第2个
        
        var pre: Character = " "
        for (i, ch) in s.enumerated() {
            let tmppre = pre
            pre = ch
            if i == 0 && ch == "0" { return 0 }
            if i > 0 && ch == "0" && (tmppre > "2" || tmppre <= "0") {
                return 0
            }
            if i == 0 { pre2 = 1; continue }
            if (tmppre == "1" || (tmppre == "2" && ch >= "0" && ch <= "6")) {
                if i == 1 {
                    if ch == "0" { pre1 = 1}
                    else { pre1 = 1 + pre2 }
                } else {
                    let tmppre = pre1
                    if ch == "0" {
                        pre1 = pre2
                        pre2 = tmppre
                    } else {
                        pre1 = pre1 + pre2
                        pre2 = tmppre
                    }
                }
            } else {
                pre2 = pre1
            }
        }
        
        return pre2
    }
}
let solu2 = Solution2()
let result2 = solu2.numDecodings("10")  // 1
//let result2 = solu.numDecodings("100") // 0
//let result2 = solu.numDecodings("2262012") // 6
//let result2 = solu.numDecodings("1") //1
//let result2 = solu.numDecodings("1267532") // 3
print(result2)


// *********************** 动态规划 别人简介代码版 ************************** //
class Solution3 {
    func numDecodings(_ s: String) -> Int {
        let cnt: Int = s.count
        if cnt == 0 { return 0 }
        var cur: Int = 1
        var pre: Int = 1
        
        var prech: Character = " "
        
        for ch in s {
            // 这里为了记录上一个字符是什么。
            let tmpprech: Character = prech
            prech = ch
            
            let tmpcur = cur
            if ch == "0" { // 字符为0时，前面字符是1或者2才有效
                if tmpprech == "1" || tmpprech == "2" { cur = pre }
                else { return 0 }
            } else if (tmpprech == "1" || (tmpprech == "2" && ch >= "1" && ch <= "6")) { // 这里类似爬楼梯；
                cur = cur + pre
            }
            pre = tmpcur
        }
        
        return cur
    }
}
let solu3 = Solution3()
//let result3 = solu3.numDecodings("10")  // 1
//let result2 = solu.numDecodings("100") // 0
let result3 = solu.numDecodings("2262012") // 6
//let result2 = solu.numDecodings("1") //1
//let result2 = solu.numDecodings("1267532") // 3
print(result3)
