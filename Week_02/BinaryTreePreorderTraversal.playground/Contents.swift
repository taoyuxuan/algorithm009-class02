import UIKit

//144. 二叉树的前序遍历
//给定一个二叉树，返回它的 前序 遍历。
//
//示例:
//输入: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//输出: [1,2,3]
//进阶: 递归算法很简单，你可以通过迭代算法完成吗？


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    // 层序创建
    static func createTree(_ list: [Int?]) -> TreeNode? {
        let count = list.count
        if count == 0 {
            return nil
        }
        guard let rootVal = list[0] else {
            return nil
        }
        
        let rootNode: TreeNode = TreeNode(rootVal)
        var queue: [TreeNode] = [rootNode]
        var i: Int = 0
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let lidx = 2*(i+1)-1
            let ridx = 2*(i+1)
            
            if lidx < count, let val = list[lidx] {
                let lnode = TreeNode(val)
                queue.append(lnode)
                node.left = lnode
            }
            if ridx < count, let val = list[ridx] {
                let rnode = TreeNode(val)
                queue.append(rnode)
                node.right = rnode
            }
            i += 1
        }
        
        return rootNode
    }
    
}

// ********************** 解法 一 递归 *********************** //
/// 经典解法
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        let leftChilds = preorderTraversal(root.left)
        let rightChilds = preorderTraversal(root.right)
        
        var ans: [Int] = []
        ans.append(root.val)
        ans.append(contentsOf: leftChilds)
        ans.append(contentsOf: rightChilds)
        
        return ans
    }
}
let tree: TreeNode? = TreeNode.createTree([1,4,2,3,5,8,nil,nil,7,9])
let solu = Solution()
let result = solu.preorderTraversal(tree)
print(result)


// ********************** 解法二 迭代 *********************** //
/// 前序遍历的迭代法 要比 中序遍历的好理解多了😂
class Solution2 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var ans: [Int] = []
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            let top = stack.removeLast()
            ans.append(top.val)
            
            if let rnode = top.right {
                stack.append(rnode)
            }
            if let lnode = top.left {
                stack.append(lnode)
            }
        }
        
        return ans
    }
}
let tree2: TreeNode? = TreeNode.createTree([1,4,2,3,5,8,nil,nil,7,9])
let solu2 = Solution()
let result2 = solu.preorderTraversal(tree2)
print(result2)
