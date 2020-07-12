import UIKit

//1122. 数组的相对排序
//给你两个数组，arr1 和 arr2，
//
//arr2 中的元素各不相同
//arr2 中的每个元素都出现在 arr1 中
//对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。
//
//
//
//示例：
//
//输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
//输出：[2,2,2,1,4,3,3,9,6,7,19]
//
//
//提示：
//
//arr1.length, arr2.length <= 1000
//0 <= arr1[i], arr2[i] <= 1000
//arr2 中的元素 arr2[i] 各不相同
//arr2 中的每个元素 arr2[i] 都出现在 arr1 中


//*********************** 解法一 **********************//
/// 开辟1000个空间的数组用来记录count个数
class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let cnt1: Int = arr1.count
        let cnt2: Int = arr2.count
        if cnt1 == cnt2 { return arr2 }
        var cntarr: [Int] = Array(repeating: 0, count: 1001)
        for num in arr1 {
            cntarr[num] += 1
        }

        var ans: [Int] = Array(repeating: 0, count: cnt1)
        var l: Int = 0
        for num in arr2 {
            var tmpcnt: Int = cntarr[num]
            while tmpcnt > 0 {
                ans[l] = num
                l += 1
                tmpcnt -= 1
            }
            cntarr[num] = 0
        }

        for (i,curcnt) in cntarr.enumerated() {
            var tmpcnt: Int = curcnt
            while tmpcnt > 0 {
                ans[l] = i
                l += 1
                tmpcnt -= 1
            }
            cntarr[i] = 0
        }

        return ans
    }
}
let solu = Solution()
let result = solu.relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])
print(result)



//*********************** 解法二 **********************//
/// 开辟1000个空间的数组用来记录count个数
class Solution2 {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let cnt1: Int = arr1.count
        let cnt2: Int = arr2.count
        if cnt1 == cnt2 { return arr2 }
        
        // 1.统计每个数的个数
        var cntmap: [Int: Int] = [:]
        for num in arr1 {
            if let tmpcnt = cntmap[num] {
                cntmap[num] = tmpcnt + 1
            } else {
                cntmap[num] = 1
            }
        }
        
        // 2.按照arr2的顺序，初始化结果数组
        var ans: [Int] = Array(repeating: 0, count: cnt1)
        var l: Int = 0
        for num in arr2 {
            if var tmpcnt = cntmap[num] {
                while tmpcnt > 0 {
                    ans[l] = num
                    l += 1
                    tmpcnt -= 1
                }
                cntmap.removeValue(forKey: num)
            }
        }
        
        var remnums: [Int] = Array(cntmap.keys)
        remnums = remnums.sorted()
        for num in remnums {
            if var tmpcnt = cntmap[num] {
                while tmpcnt > 0 {
                    ans[l] = num
                    l += 1
                    tmpcnt -= 1
                }
            }
        }
        return ans
    }
}
let solu2 = Solution2()
let result2 = solu2.relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])
print(result2)




