import UIKit

//189. 旋转数组
//给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
//
//示例 1:
//输入: [1,2,3,4,5,6,7] 和 k = 3
//输出: [5,6,7,1,2,3,4]
//解释:
//向右旋转 1 步: [7,1,2,3,4,5,6]
//向右旋转 2 步: [6,7,1,2,3,4,5]
//向右旋转 3 步: [5,6,7,1,2,3,4]
//
//示例 2:
//输入: [-1,-100,3,99] 和 k = 2
//输出: [3,99,-1,-100]
//解释:
//向右旋转 1 步: [99,-1,-100,3]
//向右旋转 2 步: [3,99,-1,-100]
//
//说明:
//尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
//要求使用空间复杂度为 O(1) 的 原地 算法。

//1.一步一步的移动，执行k次全员移动
//2.缓存数组
//3.循环移动
//4.数组翻转


// ********************************** 解法一 缓存数组法 ******************************//
/// 缓存数组法，自己最初想到的方案 其实最初想到的是 O(n+k)的一个时间复杂度，后来又优化成O(n)时间复杂度；
/// 但是空间复杂度是O(k) 按理说其实也不符合题目的要求的
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count: Int = nums.count
        if count <= 1 {
            return
        }
        
        let targetK: Int = (k%count)
        guard targetK > 0 else {
            return
        }

        var cache: [Int] = Array(repeating: 0, count:targetK)
        // 缓存最后k个元素
        let lastKStart: Int = count-targetK
        for i in 0..<count {
            let idx: Int = count-1-i
            
            if idx >= lastKStart {
                cache[idx - lastKStart] = nums[idx]
            }
            if idx >= targetK {
                nums[idx] = nums[idx-targetK]
            } else {
                nums[idx] = cache[idx]
            }
        }
    }
}

/// 测试代码
let solu = Solution()
var nums1: [Int] = [1,2,3,4,5,6,7]
solu.rotate(&nums1, 3)
print(nums1)


// ********************************** 解法二 循环移动法 ******************************//
/// 在想方案的过程中，其实也注意到了这个规律，但是想了想，那得循环多少次啊，想不太明白，就没用这种方案
/// 但是其实这种方案是不需要缓存的
/// 时间复杂度 O(n)  空间复杂度 O(1)
class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count: Int = nums.count
        if count <= 1 {
            return
        }
        let targetK: Int = (k%count)
        guard targetK > 0 else {
            return
        }
        
        var moveCount: Int = 0
        var start: Int = 0
        while moveCount < count {
            var current = start
            var pre: Int = nums[start]
            repeat {
                let next = (current + k)%count
                let tmp = nums[next]
                nums[next] = pre
                pre = tmp
                current = next
                moveCount += 1
            } while current != start
            start += 1
        }
    }
}
/// 测试代码
let solu2 = Solution2()
var nums2: [Int] = [1,2,3,4,5,6,7]
solu2.rotate(&nums2, 3)
print(nums2)


// ********************************** 解法三 反转数组 ******************************//
/// 时间复杂度 大概也是 O(n)  空间复杂度 O(1)
/// 系统函数的 reverse估计也是用的双指针法进行交换，也就是循环了 n/2次；下面的前后段的反转也是大概 n/2次；所以总的时间复杂度O(n)
class Solution3 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count: Int = nums.count
        if count <= 1 {
            return
        }
        let targetK: Int = (k%count)
        guard targetK > 0 else {
            return
        }
        
        nums.reverse()
        var l = 0
        var r = targetK-1
        while l < r {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
        
        l = targetK
        r = count-1
        while l < r {
            nums.swapAt(l, r)
            l+=1
            r-=1
        }
    }
}
/// 测试代码
let solu3 = Solution3()
var nums3: [Int] = [1,2,3,4,5,6,7]
solu3.rotate(&nums3, 3)
print(nums3)



// ********************************** 解法四 ******************************//
/// 一步一步全员移动
/// 但是这个不符合题解，时间复杂度有点高: O(kn)
class Solution4 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count: Int = nums.count
        if count <= 1 {
            return
        }
        let targetK: Int = k%count
        guard targetK > 0 else {
            return
        }
        
        for _ in 0..<targetK {
            // 移动k次 全员移动一步
            let last: Int = nums[count-1]
            for j in (0..<count).reversed() {
                if j > 0 {
                    nums[j] = nums[j-1]
                } else {
                    nums[0] = last
                }
            }
        }
    }
}

/// 测试代码
let solu4 = Solution4()
var nums4: [Int] = [-1,2]
solu4.rotate(&nums4, 3)
print(nums4)
