import UIKit

//94. 二叉树的中序遍历
//给定一个二叉树，返回它的中序 遍历。
//
//示例:
//输入: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//输出: [1,3,2]
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

// ******************************** 解法一 递归 ******************************** //
/// 常规解法
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        let leftChilds: [Int] = inorderTraversal(root.left)
        let curVal: Int = root.val
        let rightChilds: [Int] = inorderTraversal(root.right)
        
        var ans: [Int] = []
        ans.append(contentsOf: leftChilds)
        ans.append(curVal)
        ans.append(contentsOf: rightChilds)
        return ans
    }
}

let tree: TreeNode? = TreeNode.createTree([1,nil,2,3])
let solu = Solution()
let result = solu.inorderTraversal(tree)
print(result)


// ******************************** 解法二 迭代法 ******************************** //
/// 进阶解法
/// 中序遍历的迭代有点烧脑，刚开始用的那种创建新结点，然后破坏了原来tree的结构，感觉确实不太好，看的官方解法后才明白了！
/// 还是需要用辅助栈, 除了辅助栈  还需要用一个辅助指针
class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        var cur: TreeNode? = root
        var stack: [TreeNode] = []
        
        while (cur != nil || !stack.isEmpty){
            while let tmp = cur {
                stack.append(tmp)
                cur = tmp.left
            }
            
            // 当左孩子为空的时候，将父结点从栈里抽出来
            let parentNode = stack.removeLast()
            // 抽出来之后，先添加结果
            ans.append(parentNode.val)
            
            // 然后开始遍历右孩纸，也就是将指针指向右孩子
            cur = parentNode.right
        }
        
        return ans
    }
}
let tree2: TreeNode? = TreeNode.createTree([1,nil,2,3])
let solu2 = Solution2()
let result2 = solu2.inorderTraversal(tree2)
print(result2)
