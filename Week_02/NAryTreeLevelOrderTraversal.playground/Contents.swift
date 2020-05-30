import UIKit

//429. N叉树的层序遍历
//给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
//
//例如，给定一个 3叉树 :
//         1
//      /  |  \
//     3   2   4
//   /  \
//  5    6
//
//返回其层序遍历:
//[
//     [1],
//     [3,2,4],
//     [5,6]
//]
//
//说明:
//树的深度不会超过 1000。
//树的节点总数不会超过 5000。

public class Node {
     public var val: Int
     public var children: [Node]
     public init(_ val: Int) {
         self.val = val
         self.children = []
     }
    
    static func createTree(_ list: [Int:[Int]], _ root: Int) -> Node {
        let rootNode: Node = Node(root)
        if list.isEmpty {
            return rootNode
        }
        
        var queue: [Node] = [rootNode]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let key = first.val
            var childs: [Node] = []
            if let child = list[key] {
                for i in (0..<child.count) {
                    let node: Node = Node(child[i])
                    childs.append(node)
                    queue.append(node)
                }
            }
            first.children = childs
        }
        
        return rootNode
    }
}


// *********************** 解法一  迭代 **************************//
/// 辅助队列
class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var levels: [[Int]] = []
        var queue: [Node] = [root]
        
        while !queue.isEmpty {
            var tmpQueue: [Node] = []
            var oneAns: [Int] = []
            while !queue.isEmpty {
                let node = queue.removeFirst()
                oneAns.append(node.val)
                tmpQueue.append(contentsOf: node.children)
            }
            levels.append(oneAns)
            queue = tmpQueue
        }
        
        return levels
    }
}
let tree: Node = Node.createTree([1: [3,2,4], 3:[5,6]], 1)
let solu = Solution()
let result = solu.levelOrder(tree)
print(result)


// *********************** 解法二 递归 **************************//
/// 递归
/// 不太好想出来，但是看一遍，理解起来也还好
class Solution2 {
    var ans: [[Int]] = []
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        scanLevel(root, 0)
        return ans
    }
    
    func scanLevel(_ node: Node, _ level: Int) {
        if ans.count <= level {
            ans.append([])
        }
        ans[level].append(node.val)
        
        for item in node.children {
            scanLevel(item, level+1)
        }
    }
}
let tree2: Node = Node.createTree([1: [3,2,4], 3:[5,6]], 1)
let solu2 = Solution2()
let result2 = solu2.levelOrder(tree2)
print(result2)
