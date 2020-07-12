import UIKit

//231. 2的幂
//给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
//
//示例 1:
//
//输入: 1
//输出: true
//解释: 20 = 1
//示例 2:
//输入: 16
//输出: true
//解释: 24 = 16
//示例 3:
//输入: 218
//输出: false

// *********************** 解法一 正向乘运算 ********************** //
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        var num: Int = 1
        while num < n {
            num *= 2
        }
        
        return num == n
    }
}
let solu = Solution()
let result = solu.isPowerOfTwo(16)
print(result)

// *********************** 解法二 反向除运算 ********************** //
class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        if n == 1 { return true }
        var num: Int = n
        
        while num > 1 {
            if num & 1 == 1 {
                return false
            }
            num = num >> 1
        }
        
        return true
    }
}
let solu2 = Solution2()
let result2 = solu2.isPowerOfTwo(-32)
print(result2)

// *********************** 解法三 x&-x 二进制位运算的规律 ********************** //
class Solution3 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        
        return (n & (-n)) == n
    }
}
let solu3 = Solution3()
let result3 = solu3.isPowerOfTwo(8)
print(result3)


// *********************** 解法四 二进制运算 ********************** //
/// n-1 表示除了原来的1位外，小于1位的位全为1，两者相与为0
class Solution4 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        
        return n & (n-1) == 0
    }
}
let solu4 = Solution4()
let result4 = solu4.isPowerOfTwo(8)
print(result4)
