import UIKit

//42. 接雨水
//给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
//
//上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
//示例:
//输入: [0,1,0,2,1,0,1,3,2,1,2,1]
//输出: 6


// ************************* 解法一 栈解法 **************************** //
/// 因为这周主要学习了栈队列知识，先上栈的解法
/// 时间复杂度: O(n); 空间复杂度: O(n)
class Solution {
    func trap(_ height: [Int]) -> Int {
        let count = height.count
        if count <= 2 {
            return 0
        }
        var stack: [Int] = [] // 用于存放每个高度的下标
        var water: Int = 0
        for i in 0..<count {
            while let top = stack.last, height[top] < height[i] {
                let top: Int = stack.removeLast()
                if let nextTop: Int = stack.last {
                    water += ((min(height[i], height[nextTop]) - height[top]) * (i - nextTop - 1))
                } else {
                    break
                }
            }
            
            stack.append(i)
        }
        
        return water
    }
}
let solu = Solution()
let result = solu.trap([4,2,0,3,2,5])
print(result)


// ************************* 解法二 暴力解法 **************************** //
/// 刚开始没看明白，这个暴力解法是怎么弄的； 所以也是有必要学习一下暴力解法是怎么样的；
/// 计算每个元素，所能给结果贡献的雨水数量，是要遍历每个元素，然后找出它的最大的左右边界，进行计算
/// 时间复杂度: O(n)；空间复杂度: O(1)
class Solution2 {
    func trap(_ height: [Int]) -> Int {
        let count = height.count
        var water: Int = 0
        
        for i in 1..<count-1 {
            var maxLeft: Int = 0
            var maxRight: Int = 0
            for j in (0..<i).reversed() {
                maxLeft = max(height[j], height[i])
            }
            for p in (i+1..<count) {
                maxRight = max(height[p], height[i])
            }
            
            water += min(maxLeft, maxRight) - height[i]
        }
        
        return water
    }
}

let solu2 = Solution2()
let result2 = solu2.trap([4,2,0,3,2,5])
print(result2)


// ************************* 解法三 动态规划 **************************** //
/// 在上面的暴力解法中，在每次暴力遍历每个元素的左右最大边界时，有很多重复的次数，所以要想法怎么把操作去重，
/// 一般动态规划的题解，都是通过邻接表或者邻接矩阵或者数组来进行记录已经访问过的或者计算过的操作的结果，这里也
/// 一样，利用两个一位数组，将每个元素它的最大左边界和最大右边界，记录下来，以备重复操作的时候，拿出来直接用！
/// 时间复杂度: O(n)；空间复杂度: O(1)
class Solution3 {
    func trap(_ height: [Int]) -> Int {
        let count: Int = height.count
        var maxLeft: [Int] = Array.init(repeating: 0, count: count)
        var maxRight: [Int] = Array.init(repeating: 0, count: count)
        //计算每个元素的最大左边界
        for i in 0..<count {
            if i == 0 {
                maxLeft[i] = height[i]
            } else {
                maxLeft[i] = max(height[i], maxLeft[i-1])
            }
        }
        //计算每个元素的最大右边界
        for i in (0..<count).reversed() {
            if i == count - 1 {
                maxRight[i] = height[i]
            } else {
                maxRight[i] = max(maxRight[i+1], height[i])
            }
        }
        
        // 计算存水量
        var water: Int = 0
        for i in 1..<count-1 {
            let currentWater: Int = min(maxLeft[i], maxRight[i]) - height[i]
            water += currentWater
        }
        
        return water
    }
}
let solu3 = Solution3()
let result3 = solu3.trap([4,2,0,3,2,5])
print(result3)


// ************************* 解法四 双指针法 动态规划的优化方案 **************************** //
/// 动态规划中，需要先遍历2次 计算出每个元素的最大左右边界值；然后再进行计算，接下来想办法把前面两次的遍历给省掉，就可以省掉2/3的时间
/// 我都有点怀疑这种方法的正确性了？？
/// 不过想了想，这样一路遍历下来，总是处理较小的数，哪边小优先处理哪一边，所以不存在 在处理左边时 会有右边的最大值小于左边的最大的值的情况，因为和我们刚开始处理的逻辑相违背。
/// 时间复杂度: O(n)；空间复杂度: O(1)
class Solution4 {
    func trap(_ height: [Int]) -> Int {
        let count: Int = height.count
        var maxLeft: Int = 0
        var maxRight: Int = 0
        
        var l: Int = 0
        var r: Int = count - 1
        var water: Int = 0
        while l < r {
            if height[l] < height[r] {
                if height[l] > maxLeft {
                    maxLeft = height[l]
                } else {
                    water += maxLeft - height[l]
                }
                l += 1
            } else {
                if height[r] > maxRight {
                    maxRight = height[r]
                } else {
                    water += maxRight - height[r]
                }
                r -= 1
            }
        }
        
        return water
    }
}
let solu4 = Solution4()
let result4 = solu4.trap([4,2,0,3,2,5])
print(result4)
