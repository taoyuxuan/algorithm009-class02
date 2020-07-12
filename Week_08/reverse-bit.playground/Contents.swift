import UIKit

//190. 颠倒二进制位
//颠倒给定的 32 位无符号整数的二进制位。
//
//
//示例 1：
//输入: 00000010100101000001111010011100
//输出: 00111001011110000010100101000000
//解释: 输入的二进制串 00000010100101000001111010011100 表示无符号整数 43261596，
//     因此返回 964176192，其二进制表示形式为 00111001011110000010100101000000。
//
//示例 2：
//输入：11111111111111111111111111111101
//输出：10111111111111111111111111111111
//解释：输入的二进制串 11111111111111111111111111111101 表示无符号整数 4294967293，
//     因此返回 3221225471 其二进制表示形式为 10111111111111111111111111111111 。
//
//
//提示：
//请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
//在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 2 中，输入表示有符号整数 -3，输出表示有符


// *************************** 解法一 32次循环反转 ****************************//
class Solution {
    func reverseBits(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var times: Int = 32
        var ans: Int = 0
        var srcn: Int = n
        while true {
            let tmp: Int = srcn & 1
            ans += tmp
            if times == 1 {
                break
            }
            ans <<= 1
            srcn >>= 1
            times -= 1
        }
        
        return ans
    }
}

let solu = Solution()
let result = solu.reverseBits(0b00000010100101000001111010011100)
print(result)


// *************************** 解法二 按字节反转 ****************************//
class Solution2 {
    func reverseBits(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var dict: [Int: Int] = [:]
        var power: Int = 24
        var ans: Int = 0
        var srcn: Int = n
        while srcn != 0 {
            ans += reverseBytes(srcn&0xff, &dict) << power
            srcn >>= 8
            power -= 8
        }
        
        return ans
    }
    private func reverseBytes(_ byte: Int, _ dict: inout [Int:Int]) -> Int {
        if let res = dict[byte] {
            return res
        }
        let ret: Int = (byte * 0x0202020202 & 0x010884422010) % 1023
        dict[byte] = ret
        return ret
    }
}
let solu2 = Solution2()
let result2 = solu2.reverseBits(0b00000010100101000001111010011100)
print(result2)


// *************************** 解法三 按字节反转 ****************************//
class Solution3 {
    func reverseBits(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var ans: Int = n
        ans = ans >> 16 | ans << 16
        ans = ((ans & 0xff00ff00) >> 8) | ((ans & 0x00ff00ff) << 8)
        ans = ((ans & 0xf0f0f0f0) >> 4) | ((ans & 0x0f0f0f0f) << 4)
        ans = ((ans & 0xcccccccc) >> 2) | ((ans & 0x33333333) << 2)
        ans = ((ans & 0xaaaaaaaa) >> 1) | ((ans & 0x55555555) << 1)
        return ans
    }
}
let solu3 = Solution3()
let result3 = solu3.reverseBits(0b00000010100101000001111010011100)
print(result3)
