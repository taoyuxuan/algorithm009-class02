import UIKit

//242. 有效的字母异位词
//给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
//
//示例 1:
//
//输入: s = "anagram", t = "nagaram"
//输出: true
//示例 2:
//
//输入: s = "rat", t = "car"
//输出: false
//说明:
//你可以假设字符串只包含小写字母。
//
//进阶:
//如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？


// ******************** 解法一 排序 ************************//
class Solution {
// 字母异位词的含义 字母个数一样，但是顺序不一样
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let scnt: Int = s.count
        let tcnt: Int = t.count
        if scnt != tcnt { return false }
        let ssorted: String = String(s.sorted())
        let tsorted: String = String(t.sorted())
        return ssorted == tsorted
    }
}
let solu = Solution()
let result = solu.isAnagram("anagram", "nagaram")
print(result)

// ********************* 解法二 哈希计数 ********************//
class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let cnts: Int = s.count
        let cntt: Int = t.count
        if cnts != cntt  { return false }
        var cntmap: [Character: Int] = [:]
        for ch in s {
            if let tmpcnt = cntmap[ch] {
                cntmap[ch] = tmpcnt + 1
            } else {
                cntmap[ch] = 1
            }
        }
        for ch in t {
            if let tmpcnt = cntmap[ch] {
                cntmap[ch] = tmpcnt - 1
                if tmpcnt - 1 == 0 {
                    cntmap.removeValue(forKey: ch)
                }
            } else {
                return false
            }
        }
        return cntmap.count == 0
    }
}
let solu2 = Solution2()
let result2 = solu2.isAnagram("anagram", "nagaram")
print(result2)
