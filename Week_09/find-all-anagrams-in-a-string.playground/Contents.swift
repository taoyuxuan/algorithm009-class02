import UIKit

//438. 找到字符串中所有字母异位词
//给定一个字符串 s 和一个非空字符串 p，找到 s 中所有是 p 的字母异位词的子串，返回这些子串的起始索引。
//
//字符串只包含小写英文字母，并且字符串 s 和 p 的长度都不超过 20100。
//
//说明：
//字母异位词指字母相同，但排列不同的字符串。
//不考虑答案输出的顺序。
//
//示例 1:
//输入:
//s: "cbaebabacd" p: "abc"
//输出:
//[0, 6]
//解释:
//起始索引等于 0 的子串是 "cba", 它是 "abc" 的字母异位词。
//起始索引等于 6 的子串是 "bac", 它是 "abc" 的字母异位词。
//
// 示例 2:
//输入:
//s: "abab" p: "ab"
//输出:
//[0, 1, 2]
//解释:
//起始索引等于 0 的子串是 "ab", 它是 "ab" 的字母异位词。
//起始索引等于 1 的子串是 "ba", 它是 "ab" 的字母异位词。
//起始索引等于 2 的子串是 "ab", 它是 "ab" 的字母异位词。


// ************************** 解法一 ************************ //
/// 滑动窗口
/// 时间复杂度： s 的长度为n  p的长度为m    则总的时间复杂度为 O(n*m)
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let scnt: Int = s.count
        let pcnt: Int = p.count
        if scnt == 0 { return [] }
        
        // 统计p里的每个字符的个数
        var phashmap: [Character: Int] = [:]
        for ch in p {
            if let tmpcnt = phashmap[ch] {
                phashmap[ch] = tmpcnt + 1
            } else {
                phashmap[ch] = 1
            }
        }
        
        var ans: [Int] = []
        var curmap: [Character: Int] = [:]
        var l: Int = 0
        let schars: [Character] = s.map { $0 }
        for (i, ch) in schars.enumerated() {
            if let _ = phashmap[ch] {} else {
                l = i+1
                curmap.removeAll() //如果不符合，就将map清空
                continue
            }
            
            // ch在目标字串中
            if i - l + 1 <= pcnt {
                // 更新curmap
                if let tmpcnt = curmap[ch] {
                    curmap[ch] = tmpcnt + 1
                } else {
                    curmap[ch] = 1
                }
            }
            
            if i - l + 1 == pcnt {
                // 如果相等以后，判断是否match了
                var matched: Bool = true
                for (pch, tmpcnt) in phashmap {
                    if let curpchcnt = curmap[pch], curpchcnt == tmpcnt {
                        continue
                    } else {
                        matched = false
                        break
                    }
                }
                if matched {
                    ans.append(l)
                }
                if let tmpcnt = curmap[schars[l]] {
                    curmap[schars[l]] = tmpcnt - 1
                }
                l += 1
            }
        }
        return ans
    }
}

let solu = Solution()
//let result = solu.findAnagrams("cbaebabacd", "abc")
let result = solu.findAnagrams("abab", "ab")
print(result)
