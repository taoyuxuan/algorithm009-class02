import UIKit

//24. 两两交换链表中的节点
//给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
//你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
//
//示例:
//给定 1->2->3->4, 你应该返回 2->1->4->3.

// node 定义
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
    
    static func createList(_ arr: [Int]) -> ListNode? {
        var head: ListNode?
        
        var preNode: ListNode?
        arr.forEach { val in
            let tmpNode = ListNode(val)
            if head == nil {
                head = tmpNode
                preNode = tmpNode
            } else {
                preNode?.next = tmpNode
                preNode = tmpNode
            }
        }
        
        return head
    }
    
    func showNodes() {
        var p: ListNode? = self
        var arr: [Int] = []
        while let tmpVal = p?.val {
            arr.append(tmpVal)
            p = p?.next
        }
        
        print(arr)
    }
 }


// **************************** 解法一 迭代 ************************** //
/// 时间复杂度 O(n)  空间复杂度 O(1)
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        let virutalHead: ListNode = ListNode(0)
        virutalHead.next = head
        
        var p: ListNode? = virutalHead
        while p?.next != nil {
            let p1: ListNode? = p?.next
            let p2: ListNode? = p1?.next
            if p2 == nil {
                break // 只有1个结点 不用置换 退出
            }
            p1?.next = p2?.next
            p2?.next = p1
            p?.next = p2
            p = p1
        }
        
        return virutalHead.next
    }
}

let list:ListNode? = ListNode.createList([1,2,3,4])
list?.showNodes()
let solu = Solution()
let result = solu.swapPairs(list)
result?.showNodes()


// **************************** 解法二 递归************************** //
// 我去，我想说这递归代码太简洁了。。。
// 厉害 反正我没想到可以用递归实现，学习了
class Solution2 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head  // 如果没有结点或者只有一个结点 都不置换
        }
        let p1: ListNode? = head
        let p2: ListNode? = head?.next
        
        p1?.next = swapPairs(p2?.next)
        p2?.next = p1
        
        return p2
    }
}
let list2: ListNode? = ListNode.createList([1,2,3,4])
list2?.showNodes()
let solu2 = Solution2()
let result2 = solu2.swapPairs(list2)
result2?.showNodes()

