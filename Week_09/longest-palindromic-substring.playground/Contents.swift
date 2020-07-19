import UIKit

//5. 最长回文子串
//给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//示例 1：
//输入: "babad"
//输出: "bab"
//注意: "aba" 也是一个有效答案。
//
//示例 2：
//输入: "cbbd"
//输出: "bb"


// ************************** 解法一 **************************//
/// 中心扩展法
/// 时间复杂度: O(n^2)
class Solution {
    var schars: [Character] = []
    func longestPalindrome(_ s: String) -> String {
        let cnt: Int = s.count
        if cnt <= 1 { return s }
        
        let schars: [Character] = s.map { $0 }
        var maxcnt: Int = 0
        var ansl: Int = 0
        
        for i in 0..<cnt {
            let len1: Int = validPalindrome(schars, i, i)
            let len2: Int = validPalindrome(schars, i, i+1)
            
            let curmaxlen: Int = max(len1, len2)
            
            if curmaxlen > maxcnt {
                ansl = i - (curmaxlen-1)/2
                maxcnt = curmaxlen
            }
        }
        
        if maxcnt == 0 { return "" }
        
        return String(schars[ansl..<(ansl+maxcnt)])
    }
    
    func validPalindrome(_ chars: [Character], _ l: Int, _ r: Int) -> Int {
        let cnt: Int = chars.count
        if r < l { return 0 }
        var len: Int = 0
        var ll: Int = l
        var rr: Int = r
        while ll >= 0 && rr < cnt && chars[ll] == chars[rr] {
            len += (ll < rr ? 2 : 1)
            ll -= 1
            rr += 1
        }
        
        return len
    }
}
let solu = Solution()
//let result = solu.longestPalindrome("babad")
let result = solu.longestPalindrome("cbbd")
print(result)
