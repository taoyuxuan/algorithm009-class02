import UIKit

//49. 字母异位词分组
//给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
//
//示例:
//输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
//输出:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//说明：
//所有输入均为小写字母。
//不考虑答案输出的顺序。


// ******************************** 解法一 hashmap ******************************//
/// 将一个字符串所有字母出现的次数和字母组成一个 hashmap 的key，然后同一个key的字符串放到一个key下面的value里
/// 时间复杂度 O(n*字符串平均长度)   空间复杂度 O(n)
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        print("run")
        
        var dicts: [String: [String]] = [:]
        
        // 1.遍历所有字符串
        for str in strs {
            var cnts: [Int] = Array.init(repeating: 0, count: 26)
            // 2.计算每个字母出现的个数
            for c in str {
                if let idx = c.asciiValue {
                    print(idx)
                    cnts[Int(idx)-97] += 1
                }
            }
            
            var key: String = ""
            // 3.组建key
            for (i,cnt) in cnts.enumerated() {
                let charc: Character = Character(Unicode.Scalar(UInt8(i+97)))
                key += String(cnt) + String(charc)
            }
            
            // 4.查找key是否存在，并添加
            if let _ = dicts[key] {
                dicts[key]?.append(str)
            } else {
                dicts[key] = [str]
            }
        }
        let results: [[String]] = dicts.map({ $0.value })
        
        return results
    }
}

let solu = Solution()
let result = solu.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
print(result)
