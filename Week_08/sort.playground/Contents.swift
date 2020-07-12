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
print("选择排序:\(result)")

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
            
            while preidx >= 0 && nums[preidx] > inum {
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
let result2 = solu2.sort(&nums2)
print("插入排序:\(result2)")

// ************************ 解法三 冒泡排序 ************************//
// 原地排序 稳定排序
// 时间复杂度 O(n^2) 空间复杂度: O(1)
class Solution3 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt = nums.count
        if cnt == 0 { return [] }
        
        for i in (0..<cnt).reversed() {
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
let result3 = solu3.sort(&nums3)
print("冒泡排序:\(result3)")




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
        while ll < rr {
            while ll < rr && nums[rr] >= num { rr -= 1 }
            nums[ll] = nums[rr]
            while ll < rr && nums[ll] <= num { ll += 1 }
            nums[rr] = nums[ll]
        }
        nums[ll] = num
        return ll
    }
}
var nums4: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu4 = Solution4()
let result4 = solu4.sort(&nums4)
print("快速排序:\(result4)")


// ************************ 解法四 堆排序 ************************//
// 原地排序 非稳定排序
// 时间复杂度 O(nlogn) 空间复杂度: O(logn)  主要是递归所占的空间
class Solution5 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt: Int = nums.count
        if cnt == 0 { return [] }

        var i = cnt/2
        while i >= 0 {
            heapify(i, cnt, &nums)
            i -= 1
        }

        // 开始排序
        for i in (0..<cnt).reversed() {
            let tmp = nums[0]
            nums[0] = nums[i]
            nums[i] = tmp
            heapify(0, i, &nums)
        }

        return nums
    }

    private func heapify(_ i: Int, _ cnt: Int, _ nums: inout [Int]) {
        var curidx: Int = i
        while curidx*2+1 < cnt {
            let l: Int = curidx*2 + 1
            let r: Int = curidx*2 + 2
            var maxChild: Int = l
            if r < cnt && nums[r] > nums[l] {
                maxChild = r
            }
            if nums[maxChild] > nums[curidx] {
                let tmp = nums[curidx]
                nums[curidx] = nums[maxChild]
                nums[maxChild] = tmp
                curidx = maxChild
            } else {
                break
            }
        }
    }
}
var nums5: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu5 = Solution5()
let result5 = solu5.sort(&nums5)
print("堆排序:\(result5)")



// ************************ 解法四 归并排序 ************************//
// 原地排序 稳定排序
// 时间复杂度 O(nlogn) 空间复杂度: O(logn)  主要是递归所占的空间
class Solution6 {
    func sort(_ nums: inout [Int]) -> [Int] {
        let cnt: Int = nums.count
        mergeSort(0, cnt-1, &nums)
        return nums
    }
    
    private func mergeSort(_ l: Int, _ r: Int, _ nums: inout [Int]) {
        if l >= r { return }
        let mid: Int = (r-l)/2 + l
        mergeSort(l, mid, &nums)
        mergeSort(mid+1, r, &nums)
        mergePartion(l, r, mid, &nums)
    }
    
    private func mergePartion(_ l: Int, _ r: Int, _ mid: Int, _ nums: inout [Int]) {
        var s: Int = l
        var f: Int = mid+1
        var tmp: [Int] = Array(repeating: 0, count: r-l+1)
        var cidx: Int = 0
        while s <= mid && f <= r {
            if nums[s] < nums[f] {
                tmp[cidx] = nums[s]
                s += 1
            } else {
                tmp[cidx] = nums[f]
                f += 1
            }
            cidx += 1
        }
        while s <= mid {
            tmp[cidx] = nums[s]
            s += 1
            cidx += 1
        }
        while f <= r {
            tmp[cidx] = nums[f]
            cidx += 1
            f += 1
        }
        
        for i in 0..<cidx {
            nums[l+i] = tmp[i]
        }
    }
}
var nums6: [Int] = [4,6,9,1,3,2,0,2,5,7]
let solu6 = Solution6()
let result6 = solu6.sort(&nums5)
print("归并排序:\(result6)")
