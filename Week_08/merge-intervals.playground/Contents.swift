import UIKit

//56. 合并区间
//给出一个区间的集合，请合并所有重叠的区间。
//
//示例 1:
//
//输入: [[1,3],[2,6],[8,10],[15,18]]
//输出: [[1,6],[8,10],[15,18]]
//解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
//示例 2:
//
//输入: [[1,4],[4,5]]
//输出: [[1,5]]
//解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。

// *********************** 解法一 排序 ********************* //
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let cnt: Int = intervals.count
        if cnt == 0 { return [] }
        let sortedIntervals: [[Int]] = intervals.sorted { $0[0] < $1[0] }
        var merged: [[Int]] = []
        for i in 0..<cnt {
            let L = sortedIntervals[i][0]
            let R = sortedIntervals[i][1]
            let curcnt: Int = merged.count
            if curcnt == 0 || merged[curcnt-1][1] < L {
                merged.append([L,R])
            } else {
                merged[curcnt-1][1] = max(merged[curcnt-1][1], R)
            }
        }
        
        return merged
    }
}
let solu = Solution()
let result = solu.merge([[1,3],[8,10],[2,6],[15,18]])
print(result)











