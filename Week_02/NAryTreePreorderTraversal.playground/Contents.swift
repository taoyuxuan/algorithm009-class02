import UIKit

//589. N叉树的前序遍历
//给定一个 N 叉树，返回其节点值的前序遍历。
//
//例如，给定一个 3叉树 :
//         1
//      /  |  \
//     3   2   4
//   /  \
//  5    6
//
//返回其前序遍历: [1,3,5,6,2,4]。
//
//说明: 递归法很简单，你可以使用迭代法完成此题吗?


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
/// 辅助栈
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        var stack: [Node] = [root]
        while !stack.isEmpty {
            let node = stack.removeLast()
            ans.append(node.val)
            let ccnt = node.children.count
            
            if ccnt > 0 {
                for i in (0..<ccnt).reversed() {
                    stack.append(node.children[i])
                }
            }
        }
        
        return ans
    }
}

let tree: Node = Node.createTree([1: [3,2,4], 3:[5,6]], 1)
let solu = Solution()
let result = solu.preorder(tree)
print(result)


// *********************** 解法一  递归 **************************//
/// 递归  最简单通俗的解法
class Solution2 {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        let nodeVal: Int = root.val
        let ccnt: Int = root.children.count
        
        var ans: [Int] = [nodeVal]
        
        if ccnt == 0 {
            return ans
        }
        for i in (0..<ccnt) {
            let childVals: [Int] = preorder(root.children[i])
            ans.append(contentsOf: childVals)
        }
        
        return ans
    }
}
let tree2: Node = Node.createTree([1: [3,2,4], 3:[5,6]], 1)
let solu2 = Solution2()
let result2 = solu2.preorder(tree2)
print(result2)
