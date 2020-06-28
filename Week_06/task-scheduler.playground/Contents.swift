import UIKit
//621. 任务调度器
//给定一个用字符数组表示的 CPU 需要执行的任务列表。其中包含使用大写的 A - Z 字母表示的26 种不同种类的任务。任务可以以任意顺序执行，并且每个任务都可以在 1 个单位时间内执行完。CPU 在任何一个单位时间内都可以执行一个任务，或者在待命状态。
//
//然而，两个相同种类的任务之间必须有长度为 n 的冷却时间，因此至少有连续 n 个单位时间内 CPU 在执行不同的任务，或者在待命状态。
//
//你需要计算完成所有任务所需要的最短时间。
//
//
//示例 ：
//输入：tasks = ["A","A","A","B","B","B"], n = 2
//输出：8
//解释：A -> B -> (待命) -> A -> B -> (待命) -> A -> B.
//     在本示例中，两个相同类型任务之间必须间隔长度为 n = 2 的冷却时间，而执行一个任务只需要一个单位时间，所以中间出现了（待命）状态。
//
//提示：
//任务的总个数为 [1, 10000]。
//n 的取值范围为 [0, 100]。


// ********************* 解法一 ************************//
class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var map: [Int] = Array.init(repeating: 0, count: 26)
        for c in tasks {
            if let asciiValue = c.asciiValue {
                map[Int(asciiValue)-65] += 1
            }
        }
        map = map.sorted()
        print(map)
        let maxVal: Int = map[25] - 1
        var idleslot: Int = maxVal * n
        
        for i in (0...24).reversed() {
            idleslot -= min(map[i], maxVal)
        }
        print(idleslot)
        return idleslot > 0 ? idleslot + tasks.count : tasks.count
    }
}
let solu = Solution()
let result = solu.leastInterval(["A","A","A","B","B","B"], 2)
print(result)
