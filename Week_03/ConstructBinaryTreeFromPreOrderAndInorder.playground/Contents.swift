import UIKit

//105. 从前序与中序遍历序列构造二叉树
//根据一棵树的前序遍历与中序遍历构造二叉树。
//
//注意:
//你可以假设树中没有重复的元素。
//
//例如，给出
//
//前序遍历 preorder = [3,9,20,15,7]
//中序遍历 inorder = [9,3,15,20,7]
//返回如下的二叉树：
//
//    3
//   / \
//  9  20
//    /  \
//   15   7


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func showNodes() -> [Int?] {
        var queue:[TreeNode?] = [self]
        var ans: [Int?] = []
        while !queue.isEmpty {
            if let first = queue.removeFirst() {
                ans.append(first.val)
                
                queue.append(first.left)
                queue.append(first.right)
            } else {
                ans.append(nil)
            }
        }
        
        return ans
    }
}

// **************************** 解法一 递归 ******************************//
class Solution {
    
    var preorder: [Int] = []
    var inorder: [Int] = []
    var rootsIdx: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let pcount = preorder.count
        let icount = inorder.count
        if pcount != icount {
            return nil
        }
        self.preorder = preorder
        self.inorder = inorder
        for (i, val) in inorder.enumerated() {
            rootsIdx[val] = i
        }
        
        return createTree(0, _preR: pcount-1, 0, pcount-1)
    }
    
    func createTree(_ preL: Int, _preR: Int, _ inL: Int, _ inR: Int) -> TreeNode? {
        if preL > _preR {
            return nil
        }
        let rootVal: Int = preorder[preL]
        let root: TreeNode = TreeNode(rootVal)
        // 根结点在中序遍历中的位置
        let idx = rootsIdx[rootVal]!
        // 寻找左子树
        let leftCnt: Int = idx - inL
        var leftTree: TreeNode? = nil
        var rightTree: TreeNode? = nil
        if leftCnt > 0 {
            // 表示有左子树
            let preLeftLast: Int = preL + leftCnt
            leftTree = createTree(preL+1, _preR: preLeftLast, inL, idx-1)
            rightTree = createTree(preLeftLast+1, _preR: _preR, idx+1, inR)
        } else {
            rightTree = createTree(preL+1, _preR: _preR, idx+1, inR)
        }
        root.left = leftTree
        root.right = rightTree
        
        return root
    }
}
let solu = Solution()
let tree = solu.buildTree([3,9,20,15,7], [9,3,15,20,7])
let result = tree?.showNodes()
print(result)
