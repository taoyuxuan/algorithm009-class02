import UIKit

//236. 二叉树的最近公共祖先
//给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
//百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
//
//例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
//
//示例 1:
//输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
//输出: 3
//解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
//示例 2:
//输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
//输出: 5
//解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
//说明:
//所有节点的值都是唯一的。
//p、q 为不同节点且均存在于给定的二叉树中。


public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
    
    static func createTree(_ nodeval: [Int?]) -> TreeNode? {
        let count = nodeval.count
        if count == 0 || nodeval[0] == nil {
            return nil
        }
        let root: TreeNode = TreeNode(nodeval[0]!)
        var i = 0
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let lidx = 2*i+1
            let ridx = 2*i+2
            
            if lidx < count, let lval = nodeval[lidx] {
                let ln = TreeNode(lval)
                first.left = ln
                queue.append(ln)
            }
            if ridx < count, let rval = nodeval[ridx] {
                let rn = TreeNode(rval)
                first.right = rn
                queue.append(rn)
            }
            i += 1
        }
        
        return root
    }
}

// ***************************** 解法一 递归 ***************************** //
/// 思路确实比较巧！不太好理解！只要是p和q中的一个就返回结点
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        guard let p = p, let q = q else {
            return nil
        }
        
        if root.val == p.val || root.val == q.val {
            return root
        }
        let ln = lowestCommonAncestor(root.left, p, q)
        let rn = lowestCommonAncestor(root.right, p, q)
        if ln != nil && rn != nil {
            return root
        }
        
        return ln != nil ? ln : rn
    }
}
let tree = TreeNode.createTree([3,5,1,6,2,0,8,nil,nil,7,4])
let solu = Solution()
let result = solu.lowestCommonAncestor(tree, TreeNode(5), TreeNode(1))
print(result?.val ?? "nil")


// *************************** 解法二 存储父结点********************************** //
/// 这个好理解，就是递归遍历一遍所有结点，然后将其和其父结点在一个hash表里做一个连接
/// 然后从下到上依次找寻p和q的父结点们，先遍历一遍p的，做一下标记，然后再遍历q，第一个做有标记的就是需要的最近公共祖先
class Solution2 {
    
    var fa: [Int: TreeNode] = [:] // 父结点的索引
    var vis: [Int: Bool] = [:]
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        guard let p = p, let q = q else {
            return nil
        }
        
        if p.val == root.val || q.val == root.val {
            return root
        }
        
        dfs(root)
        
        var pp: TreeNode? = p
        while let tmpP = pp {
            vis[tmpP.val] = true
            pp = fa[tmpP.val]
        }
        
        var qq: TreeNode? = q
        while let tmpQq = qq {
            if let visited = vis[tmpQq.val], visited {
                return qq
            }
            qq = fa[tmpQq.val]
        }
        
        return nil
    }
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        if let ln = root.left {
            fa[ln.val] = root
            dfs(ln)
        }
        if let rn = root.right {
            fa[rn.val] = root
            dfs(rn)
        }
    }
}
let tree2 = TreeNode.createTree([3,5,1,6,2,0,8,nil,nil,7,4])
let solu2 = Solution2()
let result2 = solu2.lowestCommonAncestor(tree2, TreeNode(5), TreeNode(4))
print(result2?.val ?? "nil")
