import UIKit

//146. LRU缓存机制
//运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
//
//获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
//写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
//
//进阶:
//你是否可以在 O(1) 时间复杂度内完成这两种操作？
//
//示例:
//
//LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
//
//cache.put(1, 1);
//cache.put(2, 2);
//cache.get(1);       // 返回  1
//cache.put(3, 3);    // 该操作会使得关键字 2 作废
//cache.get(2);       // 返回 -1 (未找到)
//cache.put(4, 4);    // 该操作会使得关键字 1 作废
//cache.get(1);       // 返回 -1 (未找到)
//cache.get(3);       // 返回  3
//cache.get(4);       // 返回  4

// *********************** 解法一 ***********************//
// 双向链表

class LRUCache {
    var elems: [Int: Node] = [:]
    var head: Node
    var tail: Node
    var capacity: Int = 0
    var curcount: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.curcount = 0
        self.head = Node(0,0)
        self.tail = Node(0,0)
        self.head.next = self.tail
        self.tail.pre = self.head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = elems[key] else {
            return -1
        }
        //去除旧关系
        node.pre?.next = node.next
        node.next?.pre = node.pre
        
        // 添加新关系
        node.pre = self.tail.pre
        node.next = self.tail
        self.tail.pre?.next = node
        self.tail.pre = node
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        let curnode: Node
        if let node = elems[key] {
            curnode = node
            curnode.value = value
            // 去除旧关系
            curnode.pre?.next = curnode.next
            curnode.next?.pre = curnode.pre
        } else {
            curnode = Node(key,value)
            if curcount == capacity {
                // 删除旧结点
                let deletenode = self.head.next
                deletenode?.next?.pre = self.head
                self.head.next = deletenode
                if let deletekey = deletenode?.key {
                    elems.removeValue(forKey: deletekey)
                }
            } else {
                curcount += 1
            }
            elems[key] = curnode
        }
        
        // 添加新结点关系
        curnode.pre = self.tail.pre
        curnode.next = self.tail
        self.tail.pre?.next = curnode
        self.tail.pre = curnode
    }
    
    class Node {
        var key: Int
        var value: Int
        var pre: Node?
        var next: Node?
        
        init(_ k: Int, _ v: Int) {
            self.key = k
            self.value = v
        }
    }
}
