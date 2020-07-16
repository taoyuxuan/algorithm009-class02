import UIKit

//680. 验证回文字符串 Ⅱ
//给定一个非空字符串 s，最多删除一个字符。判断是否能成为回文字符串。
//
//示例 1:
//
//输入: "aba"
//输出: True
//示例 2:
//
//输入: "abca"
//输出: True
//解释: 你可以删除c字符。
//注意:
//
//字符串只包含从 a-z 的小写字母。字符串的最大长度是50000。


// ******************* 解法一 ******************//
/// 递归
class Solution {
    var src: [Character] = []
    func validPalindrome(_ s: String) -> Bool {
        src = s.map { $0 }
        return isValid(0, s.count-1, 1)
    }
    private func isValid(_ l: Int, _ r: Int, _ delCnt: Int) -> Bool {
        if l>=r { return true }
        if src[l] == src[r] {
            return isValid(l+1, r-1, delCnt)
        } else if delCnt > 0 {
            return isValid(l+1, r, delCnt-1) || isValid(l, r-1, delCnt-1)
        } else {
            return false
        }
    }
}
let solu = Solution()
let result = solu.validPalindrome("abca")
print(result)
