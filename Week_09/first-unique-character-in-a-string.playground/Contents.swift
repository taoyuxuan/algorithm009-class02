import UIKit

//387. 字符串中的第一个唯一字符
//给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
//
//示例：
//s = "leetcode"
//返回 0
//
//s = "loveleetcode"
//返回 2
//
//提示：你可以假定该字符串只包含小写字母。


// **************************** 解法一 ****************************//
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var map:[Character: Int] = [:]
        for ch in s {
            if let cnt = map[ch] {
                map[ch] = cnt+1
            } else {
                map[ch] = 1
            }
        }
        
        for (i,ch) in s.enumerated() {
            if let cnt = map[ch], cnt == 1 {
                return i
            }
        }
        
        return -1
    }
}
let solu = Solution()
let result = solu.firstUniqChar("leetcode")
print(result)
