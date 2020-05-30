import UIKit

//347. 前 K 个高频元素
//给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
//
//示例 1:
//输入: nums = [1,1,1,2,2,3], k = 2
//输出: [1,2]
//示例 2:
//输入: nums = [1], k = 1
//输出: [1]
//提示：
//你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
//你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
//题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的。
//你可以按任意顺序返回答案。


// ********************** 解法一 topk 推排 ************************** //
/// 堆排序 还是不熟啊， 得练
class Solution {
    var dicts:[Int: Int] = [:]
    var heap:[Int] = []
    var K: Int = 0
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < 2 {
            if nums.count == 0 {
                return []
            }
            return nums
        }
        
        self.K = k

        // 1.构建一个哈希表，存储每个元素对应的频次
        for val in nums {
            if let cnt = dicts[val] {
                dicts[val] = cnt + 1
            } else {
                dicts[val] = 1
            }
        }

        let keys: [Int] = Array(dicts.keys)
        // 2.构建一个k个元素的小顶堆
        self.heap = Array(keys.prefix(k))
        // 堆化
        for i in (0..<k/2).reversed() {
            heapify(i)
        }

        // 3.开始遍历并堆化
        for i in k..<keys.count {
            let cnt1 = dicts[keys[i]]!
            let cnt2 = dicts[heap[0]]!
            if cnt1 > cnt2 {
                heap[0] = keys[i]
                heapify(0)
            }
        }

        // 4.剩余的堆内的k个元素，就是最大的k个元素
        return heap
    }

    func heapify(_ i: Int) {
        var j = i
        while j < self.K {
            let lidx = 2*(j+1)-1
            let ridx = 2*(j+1)

            var minIdx: Int = lidx
            if lidx >= self.K {
                break
            }
            if ridx < self.K {
                minIdx = dicts[heap[lidx]]! > dicts[heap[ridx]]! ? ridx : lidx
            }
            
            let tmp = heap[j]
            if dicts[tmp]! > dicts[heap[minIdx]]! {
                heap[j] = heap[minIdx]
                heap[minIdx] = tmp
            }
            j = minIdx
        }
    }
}
let solu = Solution()
let result = solu.topKFrequent([1,1,1,2,2,3], 2)
print(result)
