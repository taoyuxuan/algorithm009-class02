import UIKit

//874. 模拟行走机器人
//机器人在一个无限大小的网格上行走，从点 (0, 0) 处开始出发，面向北方。该机器人可以接收以下三种类型的命令：
//
//-2：向左转 90 度
//-1：向右转 90 度
//1 <= x <= 9：向前移动 x 个单位长度
//在网格上有一些格子被视为障碍物。
//第 i 个障碍物位于网格点  (obstacles[i][0], obstacles[i][1])
//机器人无法走到障碍物上，它将会停留在障碍物的前一个网格方块上，但仍然可以继续该路线的其余部分。
//返回从原点到机器人所有经过的路径点（坐标为整数）的最大欧式距离的平方。
//
//示例 1：
//输入: commands = [4,-1,3], obstacles = []
//输出: 25
//解释: 机器人将会到达 (3, 4)
//
//示例 2：
//输入: commands = [4,-1,4,-2,4], obstacles = [[2,4]]
//输出: 65
//解释: 机器人在左转走到 (1, 8) 之前将被困在 (1, 4) 处
//
//提示：
//0 <= commands.length <= 10000
//0 <= obstacles.length <= 10000
//-30000 <= obstacle[i][0] <= 30000
//-30000 <= obstacle[i][1] <= 30000
//答案保证小于 2 ^ 31


// *************************** 解法一 ************************ //
class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var pointmap: [[Int]: Bool] = [:]
        for obstacle in obstacles {
            pointmap[obstacle] = true
        }
        
        let dir: [(Int, Int)] = [(0,1), (1,0), (0, -1), (-1, 0)]
        var curDirIdx: Int = 0
        var (curPointX, curPointY) = (0, 0)
        var maxDis: Int = 0
        for i in commands {
            if i == -1 {
                curDirIdx = (curDirIdx + 1) % 4
            } else if i == -2 {
                curDirIdx = (curDirIdx - 1 + 4) % 4
            } else {
                let (x, y) = dir[curDirIdx]
                for j in 0..<i {
                    let curX: Int = curPointX + x
                    let curY: Int = curPointY + y
                    if let isInMap = pointmap[[curX,curY]], isInMap {
                        break
                    }
                    curPointX = curX
                    curPointY = curY
                    let odis: Int = curPointX * curPointX + curPointY * curPointY
                    maxDis = odis > maxDis ? odis : maxDis
                }
            }
        }
        
        return maxDis
    }
}
let solu = Solution()
let result = solu.robotSim([-2,8,3,7,-1], [[-4,-1],[1,-1],[1,4],[5,0],[4,5],[-2,-1],[2,-5],[5,1],[-3,-1],[5,-3]])
print(result)
//[-2,8,3,7,-1]
//[[-4,-1],[1,-1],[1,4],[5,0],[4,5],[-2,-1],[2,-5],[5,1],[-3,-1],[5,-3]]
