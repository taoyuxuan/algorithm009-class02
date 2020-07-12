import UIKit

//用自己熟悉的编程语言，手写各种初级排序代码，提交到学习总结中。

// 基本的排序方式： 选择排序、插入排序、冒泡排序
// 进阶的排序方式:  快速排序、堆排序、归并排序

// 统一按升序排序

// ************************ 解法一 选择排序 ************************//
// 原地排序 稳定排序
// 时间复杂度 O(n^2) 空间复杂度: O(1)
class Solution {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt = nums.count
        if cnt == 0 { return [] }
        
        for i in 0..<cnt {
            var minidx: Int = i
            for j in (i+1)..<cnt {
                minidx = nums[minidx] > nums[j] ? j : minidx
            }
            let curelem = nums[i]
            nums[i] = nums[minidx]
            nums[minidx] = curelem
        }
        
        return nums
    }
}
var nums1: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu = Solution()
let result = solu.sort(&nums1)
print(result)

// ************************ 解法二 插入排序 ************************//
// 原地排序 稳定排序
// 时间复杂度 O(n^2) 空间复杂度: O(1)
class Solution2 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt = nums.count
        if cnt == 0 { return [] }
        
        for i in 0..<cnt {
            if i == 0 {
                continue
            }
            let inum: Int = nums[i]
            var preidx: Int = i - 1
            
            while nums[preidx] > inum {
                let tmp: Int = nums[preidx]
                nums[preidx] = inum
                nums[preidx+1] = tmp
                preidx -= 1
            }
        }
        
        return nums
    }
}
var nums2: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu2 = Solution2()
let result2 = solu2.sort(&nums1)
print(result2)

// ************************ 解法三 冒泡排序 ************************//
// 原地排序 稳定排序
// 时间复杂度 O(n^2) 空间复杂度: O(1)
class Solution3 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt = nums.count
        if cnt == 0 { return [] }
        
        for i in 0..<cnt {
            for j in 0..<i {
                if nums[j] > nums[j+1] {
                    let tmp: Int = nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = tmp
                }
            }
        }
        
        return nums
    }
}
var nums3: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu3 = Solution3()
let result3 = solu3.sort(&nums1)
print(result3)


// ************************ 解法四 快速排序 ************************//
// 原地排序 非稳定排序
// 时间复杂度 O(nlogn) 空间复杂度: O(logn)  主要是递归所占的空间
class Solution4 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt: Int = nums.count
        if cnt == 0 { return [] }
        quickSort(0, cnt-1, &nums)
        return nums
    }
    
    private func quickSort(_ l: Int, _ r: Int, _ nums: inout [Int]) {
        if l >= r { return }
        let mid: Int = partionIndex(l, r, &nums)
        quickSort(l, mid-1, &nums)
        quickSort(mid+1, r, &nums)
    }
    
    private func partionIndex(_ l: Int, _ r: Int, _ nums: inout [Int]) -> Int {
        if l > r { abort() }
        if l == r { return l }
        
        let num: Int = nums[l]
        var ll: Int = l
        var rr: Int = r
        
        while ll < rr && nums[rr] >= num { rr -= 1 }
        nums[ll] = nums[rr]
        while ll < rr && nums[ll] <= num { ll += 1 }
        nums[rr] = nums[ll]
        nums[ll] = num
        return ll
    }
}
var nums4: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu4 = Solution4()
let result4 = solu4.sort(&nums1)
print(result4)


// ************************ 解法四 堆排序 ************************//
// 原地排序 非稳定排序
// 时间复杂度 O(nlogn) 空间复杂度: O(logn)  主要是递归所占的空间
class Solution5 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt: Int = nums.count
        if cnt == 0 { return [] }
        
        for i in 0..<cnt/2 {
            heapify(<#T##i: Int##Int#>, <#T##nums: &[Int]##[Int]#>)
        }
    }
    
    private func heapify(_ i: Int, _ nums: inout [Int]) {
        
    }
}
