import UIKit

//283. 移动零
//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
//示例:
//输入: [0,1,0,3,12]
//输出: [1,3,12,0,0]
//说明:
//必须在原数组上操作，不能拷贝额外的数组。
//尽量减少操作次数。


// ************************* 解法一 自己的解法 ***************************//
/// 双指针法：时间复杂度 O(n) 空间复杂度O(1)
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        let count: Int = nums.count
        var idx1: Int = 0
        var idx2: Int = 0
        while idx1 < count {
            if idx2 < count {
                if nums[idx2] == 0 {
                    idx2 += 1
                    continue
                } else if idx1 != idx2 {
                    // 两个不相等就需要交换
                    nums[idx1] = nums[idx2]
                    idx1 += 1
                    idx2 += 1
                }
            } else {
                nums[idx1] = 0
                idx1 += 1
            }
        }
    }
}

let solu = Solution()
var nums: [Int] = [0,1,0,3,12]
solu.moveZeroes(&nums)
print(nums)



// ************************* 解法二 双指针交换 ***************************//
/// 刚开始有点不太理解，就不怕nums[idx1]慢指针指向的是非0值？后来想想，所有idx2之前的非0值全部移动到idx1之前了，
/// idx1和idx2之间剩下的只能是 0 值。如果idx1指向非0值，那和idx2遇到非0值就向前移动的理论相违背了！
/// 这个方法挺妙的！
/// 双指针法：时间复杂度 O(n) 空间复杂度O(1)  虽然都是O(n)但是却减少了赋值的次数
class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        let count: Int = nums.count
        var idx1: Int = 0
        print("run")
        for idx2 in 0..<count {
            if nums[idx2] != 0 {
                if idx1 != idx2 {
                    // 只有两者不相等，而且idx2所在位置的元素不为0时才交换；
                    let tmp: Int = nums[idx1]
                    nums[idx1] = nums[idx2]
                    nums[idx2] = tmp
                }
                idx1 += 1
            }
        }
    }
}

let solu2 = Solution2()
var nums2: [Int] = [1,2]
solu2.moveZeroes(&nums2)
print(nums2)
