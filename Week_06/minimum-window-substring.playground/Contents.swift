import UIKit
//
//76. 最小覆盖子串
//给你一个字符串 S、一个字符串 T，请在字符串 S 里面找出：包含 T 所有字符的最小子串。
//
//示例：
//
//输入: S = "ADOBECODEBANC", T = "ABC"
//输出: "BANC"


// **************************** 解法一 ******************************* //
class Solution {
    var ori: [Character: Int] = [:]
    var cnt: [Character: Int] = [:]
    func minWindow(_ s: String, _ t: String) -> String {
        
        for ch in t {
            if let tmpcnt = cnt[ch] {
                ori[ch] = tmpcnt + 1
            } else {
                ori[ch] = 1
            }
        }
        
        var l: Int = 0  // 遍历左右指针
        var r: Int = -1
        var len: Int = Int.max
        var ansL: Int = -1
        
        let schars: [Character] = s.map { $0 }
        
        for ch in s {
            // 1.如果当前的字符是在目标字符串里，那么cnt加1
            if ori[ch] != nil {
                if let tmpcnt = cnt[ch] {
                    cnt[ch] = tmpcnt + 1
                } else {
                    cnt[ch] = 1
                }
            }
            while check() && l <= r {
                // 保留ansL
                if r - l + 1 < len {
                    len = r - l + 1
                    ansL = l
                }
                if ori[schars[l]] != nil {
                    if let tmpcnt: Int = cnt[schars[l]] {
                        cnt[schars[l]] = tmpcnt - 1
                    } else {
                        cnt[schars[l]] = -1
                    }
                }
                l += 1
            }
            r += 1
        }
        
        var ansStr: String = s
        if ansL > 0 { ansStr.removeFirst(ansL) }
        
        let scharcnt: Int = s.count
        if ansL + len < scharcnt {
            print("ansL:\(ansL);len:\(len);s count:\(scharcnt)")
            ansStr.removeLast(scharcnt - ansL - len)
        }
        
        return ansL == -1 ? "" : String(ansStr)
    }
    
    func check() -> Bool {
        for (ch, chcnt) in ori {
            if let tmpcnt = cnt[ch] {
                if tmpcnt < chcnt {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}
let solu = Solution()
let result = solu.minWindow("ADOBECODEBANC", "ABC")
//let result = solu.minWindow("ab", "a")
print(result)













