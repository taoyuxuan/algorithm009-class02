import UIKit

//21. 合并两个有序链表
//将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
//
//示例：
//输入：1->2->4, 1->3->4
//输出：1->1->2->3->4->4

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


// ***************************  解法一 迭代 ***************************** //

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let virtualHead: ListNode = ListNode(0)
        var p: ListNode? = virtualHead
        var p1: ListNode? = l1
        var p2: ListNode? = l2
        while let p1val = p1?.val, let p2val = p2?.val {
            if p1val <= p2val {
                p?.next = p1
                p1 = p1?.next
            } else {
                p?.next = p2
                p2 = p2?.next
            }
            p = p?.next
        }
        
        if p1 != nil {
            p?.next = p1
        } else if p2 != nil {
            p?.next = p2
        }
        
        return virtualHead.next
    }
}

let l1: ListNode? = ListNode.createList([1,2,4])
let l2: ListNode? = ListNode.createList([1,3,4])
let solu = Solution()
let result = solu.mergeTwoLists(l1, l2)
result?.showNodes()


// ***************************  解法二 递归 ***************************** //

class Solution2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let p1val = l1?.val, let p2val = l2?.val else {
            if l1 == nil {
                return l2
            }
            return l1
        }
        
        if p1val <= p2val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}
let s2l1: ListNode? = ListNode.createList([1,2,4])
let s2l2: ListNode? = ListNode.createList([1,3,4])
let solu2 = Solution2()
let result2 = solu2.mergeTwoLists(s2l1, s2l2)
result2?.showNodes()
