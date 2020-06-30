import UIKit

//410. 分割数组的最大值
//给定一个非负整数数组和一个整数 m，你需要将这个数组分成 m 个非空的连续子数组。设计一个算法使得这 m 个子数组各自和的最大值最小。
//
//注意:
//数组长度 n 满足以下条件:
//
//1 ≤ n ≤ 1000
//1 ≤ m ≤ min(50, n)
//示例:
//
//输入:
//nums = [7,2,5,10,8]
//m = 2
//
//输出:
//18
//
//解释:
//一共有四种方法将nums分割为2个子数组。
//其中最好的方式是将其分为[7,2,5] 和 [10,8]，
//因为此时这两个子数组各自的和的最大值为18，在所有情况中最小。



// ************************* 解法一 回溯法  超时 *********************** //
/// 这个回溯法 我不知道怎么改进？找不到应该存储哪些可记录的缓存
class Solution {
    var maxSums: [Int] = []
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let cnt: Int = nums.count
        if cnt == 0 { return 0 }
        nextSubArraySum(nums, m, 0)
        let sortedNums: [Int] = maxSums.sorted()
        return sortedNums[0]
    }
    
    private func nextSubArraySum(_ nums: [Int], _ m: Int, _ maxSum: Int) {
        let cnt: Int = nums.count
        if cnt < m || (m == 0 && cnt > 0) {
            return
        } else if m == 0 && cnt == 0 {
            maxSums.append(maxSum)
        }
        
        var sum: Int = 0
        for i in 0..<cnt {
            sum += nums[i]
            var nextnums: [Int] = nums
            nextnums.removeFirst(i+1)
            nextSubArraySum(nextnums, m-1, max(sum, maxSum))
        }
    }
}
let solu = Solution()
let result = solu.splitArray([7,2,5,10,8], 2)
print(result)


// ************************* 解法二 动态规划 *********************** //
//思路：
//这个问题满足无后向性的特点。我们可以用动态规划来解决它。
//无后向性的特点意味着，一旦当前状态确定了，它就不会被之后的状态影响。在这个问题里面，如果我们在将 nums[0..i] 分成 j 份时得到了当前最小的分割数组的最大值，不论后面的部分怎么分割这个值不会受到影响。
//
//算法：
//首先我们把 f[i][j] 定义为将 nums[0..i] 分成 j 份时能得到的最小的分割子数组最大值。
//对于第 j 个子数组，它为数组中下标 k + 1 到 i 的这一段。因此，f[i][j] 可以从 max(f[k][j - 1], nums[k + 1] + ... + nums[i]) 这个公式中得到。遍历所有可能的 k，会得到 f[i][j] 的最小值。
//
//整个算法那的最终答案为 f[n][m]，其中 n 为数组大小。
class Solution2 {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let cnt: Int = nums.count
        var fn:[[Int]] = Array.init(repeating: Array.init(repeating: Int.max, count: m+1), count: cnt+1)
        // 前缀和
        var sub: [Int] = Array.init(repeating: 0, count: cnt+1)
        for i in 0..<cnt {
            sub[i+1] = sub[i] + nums[i]
        }
        fn[0][0] = 0
        for i in 1...cnt {
            for j in 1...m {
                for k in 0..<i {
                    fn[i][j] = min(fn[i][j], max(fn[k][j-1], sub[i]-sub[k]))
                }
            }
        }
        return fn[cnt][m]
    }
}
let solu2 = Solution2()
let result2 = solu.splitArray([7,2,5,10,8], 2)
print(result2)


// ************************* 解法三 二分查找 *********************** //
///
class Solution3 {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var l: Int = nums[0]
        var r: Int = 0
        
        for num in nums {
            r += num
            l = l > num ? l : num
        }
        
        while l < r {
            let mid: Int = (l+r)/2
            var cnt: Int = 1
            var tmp: Int = 0 // 初始值为什么必须是1？难道是因为最后剩余的算一个？
            for num in nums {
                tmp += num
                if tmp > mid {
                    tmp = num
                    cnt += 1
                }
            }
            if cnt > m {
                l = mid + 1
            } else {
                r = mid
            }
        }
        
        return l
    }
}
let solu3 = Solution3()
let result3 = solu3.splitArray([7,2,5,10,8], 2)
print(result3)



