import UIKit

//557. 反转字符串中的单词 III
//给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。
//
//示例 1:
//
//输入: "Let's take LeetCode contest"
//输出: "s'teL ekat edoCteeL tsetnoc"
//注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

// *********************** 解法一 *********************//
class Solution {
    func reverseWords(_ s: String) -> String {
        let cnt: Int = s.count
        if cnt == 0 { return "" }
        var ans: String = ""
        let arr = s.split(separator: " ")
        let arrcnt: Int = arr.count
        for i in 0..<arrcnt {
            ans += String(arr[i].reversed())
            if i < arrcnt - 1 {
                ans += " "
            }
        }
        return ans
    }
}
let solu = Solution()
let result = solu.reverseWords("Let's take LeetCode contest")
print(result)
