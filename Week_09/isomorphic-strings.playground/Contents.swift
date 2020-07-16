import UIKit

//205. 同构字符串
//给定两个字符串 s 和 t，判断它们是否是同构的。
//
//如果 s 中的字符可以被替换得到 t ，那么这两个字符串是同构的。
//
//所有出现的字符都必须用另一个字符替换，同时保留字符的顺序。两个字符不能映射到同一个字符上，但字符可以映射自己本身。
//
//示例 1:
//输入: s = "egg", t = "add"
//输出: true
//
//示例 2:
//输入: s = "foo", t = "bar"
//输出: false
//
//示例 3:
//输入: s = "paper", t = "title"
//输出: true

//说明:
//你可以假设 s 和 t 具有相同的长度。

// **************** 解法一 ******************//
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let scnt: Int = s.count
        let tcnt: Int = t.count
        if scnt != tcnt { return false }
        let schars: [Character] = s.map { $0 }
        let tchars: [Character] = t.map { $0 }
        
        var map: [Character: Character] = [:]
        var map2: [Character: Character] = [:]
        for i in 0..<scnt {
            if let ch = map[schars[i]] {
                if ch != tchars[i] {
                    return false
                }
            } else {
                map[schars[i]] = tchars[i]
            }
            if let ch = map2[tchars[i]] {
                if ch != schars[i] {
                    return false
                }
            } else {
                map2[tchars[i]] = schars[i]
            }
        }
        
        return true
    }
}
let solu = Solution()
let result = solu.isIsomorphic("ab", "ca")
print(result)
