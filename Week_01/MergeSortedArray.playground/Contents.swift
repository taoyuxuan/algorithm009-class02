import UIKit

//88. 合并两个有序数组
//给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
//
//说明:
//初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
//你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
//
//示例:
//输入:
//nums1 = [1,2,3,0,0,0], m = 3
//nums2 = [2,5,6],       n = 3
//输出: [1,2,2,3,5,6]


// ***************************** 解法一 倒序遍历赋值 **************************** //
// 时间复杂度 O(m+n) 空间复杂度 O(1)
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var idx1: Int = m-1
        var idx2: Int = n-1
        
        for i in (0..<m+n).reversed() {
            if idx1 < 0 || idx2 < 0 {
                if idx2 < 0 { break } else {
                    nums1[i] = nums2[idx2]
                    idx2 -= 1
                }
            } else {
                if nums1[idx1] >= nums2[idx2] {
                    nums1[i] = nums1[idx1]
                    idx1 -= 1
                } else {
                    nums1[i] = nums2[idx2]
                    idx2 -= 1
                }
            }
        }
    }
}
var nums:[Int] = [1,2,3,0,0,0]
let nums2: [Int] = [2,5,6]
let solu = Solution()
solu.merge(&nums, 3, nums2, 3)
print(nums)



// ***************************** 解法二 拷贝排序 其实对应官方第一种方法 **************************** //
/// 执行用时 :12 ms, 在所有 Swift 提交中击败了95.84%的用户
/// 内存消耗 :20.7 MB, 在所有 Swift 提交中击败了100.00%的用户
/// 呃。这个效率这么高吗？有点惊讶，比上一个还高！！这个的时间复杂度应该大概是O(m*n); 拷贝O(m) 加上 后面的比较替换的应该是O(m*n) 但是这里数组基本有序，到后面替换的机会不算多，也许是因为这样导致了时间复杂度降低了？
class Solution2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        // 拷贝
        for i in 0..<n {
            nums1[i+m] = nums2[i]
        }
        // 排序 双指针排序
        var idx1: Int = 0
        var idx2: Int = m
        
        while idx1 < m && idx2 < m+n {
            if nums1[idx1] <= nums1[idx2] {
                idx1 += 1
            } else {
                let tmp = nums1[idx1]
                nums1[idx1] = nums1[idx2]
                nums1[idx2] = tmp
                var tmpIdx: Int = idx2
                var tmpIdxNext: Int = idx2 + 1
                while tmpIdxNext < (m+n) && nums1[tmpIdxNext] < nums1[tmpIdx] {
                    let tmpVal = nums1[tmpIdx]
                    nums1[tmpIdx] = nums1[tmpIdxNext]
                    nums1[tmpIdxNext] = tmpVal

                    tmpIdxNext += 1
                    tmpIdx += 1
                }
                
                idx1 += 1
            }
        }
    }
}
var n2:[Int] = [1,2,3,0,0,0]
let numst2: [Int] = [2,5,6]
let solu2 = Solution2()
solu2.merge(&n2, 3, numst2, 3)
print(n2)
