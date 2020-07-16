import UIKit
//541. 反转字符串 II
//给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。
//
//如果剩余字符少于 k 个，则将剩余字符全部反转。
//如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
//
//
//示例:
//
//输入: s = "abcdefg", k = 2
//输出: "bacdfeg"
//
//
//提示：
//
//该字符串只包含小写英文字母。
//给定字符串的长度和 k 在 [1, 10000] 范围内

// ******************* 解法一 **********************//
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        let cnt: Int = s.count
        if cnt == 0 { return "" }
        if k == 0 { return s }
        var schars: [Character] = s.map { $0 }
        var i: Int = 0
        while i < cnt {
            var l: Int = i
            let ni: Int = i + 2*k
            var r: Int = l+k-1
            if r >= cnt { r = cnt - 1 }
            while l < r {
                let tmp: Character = schars[l]
                schars[l] = schars[r]
                schars[r] = tmp
                l += 1
                r -= 1
            }
            i = ni
        }
        
        return String(schars)
    }
}
let solu = Solution()
//let result = solu.reverseStr("abcdefg", 2)
let result = solu.reverseStr("abcdefg", 1)
print(result)
