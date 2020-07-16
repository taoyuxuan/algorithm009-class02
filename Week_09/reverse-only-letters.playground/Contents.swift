import UIKit

//917. 仅仅反转字母
//给定一个字符串 S，返回 “反转后的” 字符串，其中不是字母的字符都保留在原地，而所有字母的位置发生反转。
//
//示例 1：
//输入："ab-cd"
//输出："dc-ba"
//
//示例 2：
//输入："a-bC-dEf-ghIj"
//输出："j-Ih-gfE-dCba"
//
//示例 3：
//输入："Test1ng-Leet=code-Q!"
//输出："Qedo1ct-eeLg=ntse-T!"
//
//提示：
//S.length <= 100
//33 <= S[i].ASCIIcode <= 122
//S 中不包含 \ or "


// ***************** 解法一 双指针 *************** //
/// O(n)
class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        let cnt: Int = S.count
        if cnt == 0 { return "" }
        var schars: [Character] = S.map { $0 }
        var l: Int = 0
        var r: Int = cnt-1
        while l<r {
            let lc: Character = schars[l]
            if !((lc >= "a" && lc <= "z") || (lc >= "A" && lc <= "Z")) {
                l += 1
                continue
            }
            let rc: Character = schars[r]
            if !((rc >= "a" && rc <= "z") || (rc >= "A" && rc <= "Z")) {
                r -= 1
                continue
            }
            schars[l] = rc
            schars[r] = lc
            l += 1
            r -= 1
        }
        
        return String(schars)
    }
}
let solu = Solution()
let result = solu.reverseOnlyLetters("a-bC-dEf-ghIj")
print(result)
