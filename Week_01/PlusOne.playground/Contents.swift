import UIKit

//66. 加一
//给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
//最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
//你可以假设除了整数 0 之外，这个整数不会以零开头。
//
//示例 1:
//输入: [1,2,3]
//输出: [1,2,4]
//解释: 输入数组表示数字 123。
//示例 2:
//输入: [4,3,2,1]
//输出: [4,3,2,2]
//解释: 输入数组表示数字 4321。


// ***************************** 解法一 **************************** //
/// 倒序加1 如果中间碰到有一位不是9的数，直接返回即可
/// 能倒序到第一个的情况，是所有位全是9的情况，这时候只有第一位是1  其他都是0
/// 时间复杂度其实也是 O(n) 但是减少了很多不必要的操作
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        let count: Int = digits.count
        var source: [Int] = digits  // swift的参数无法修改，只能重新再开辟一块内存
        
        for idx in (0..<count).reversed() {
            if source[idx] == 9 {
                source[idx] = 0
            } else {
                source[idx] += 1
                return source
            }
        }
        source[0] = 1
        source.append(0)
        return source
    }
}

let solu = Solution()
let result = solu.plusOne([9,9,9])
print(result)


// ***************************** 解法二 自己开始的想法 **************************** //
/// 刚开始连 pre == 0 判断都没有，这种方法无形多了很多不必要的操作，而且最后还有一个插入操作，如果swift数组底层用的平衡二叉树实现的，又多加了O(logn)的插入时间。
/// 时间复杂度: O(n)
class Solution2 {
    func plusOne(_ digits: [Int]) -> [Int] {
        let count: Int = digits.count
        var source: [Int] = digits  // swift的参数无法修改，只能重新再开辟一块内存
        
        var pre: Int = 1
        for i in (0..<count).reversed() {
            let tmpSum: Int = source[i] + pre
            pre = tmpSum/10
            source[i] = tmpSum%10
            if pre == 0 {
                break
            }
        }
        
        if pre == 1 {
            source.insert(1, at: 0)
        }
        return source
    }
}

let solu2 = Solution2()
let result2 = solu2.plusOne([9,9,9])
print(result2)
