import UIKit

//641. 设计循环双端队列
//设计实现双端队列。
//你的实现需要支持以下操作：
//
//MyCircularDeque(k)：构造函数,双端队列的大小为k。
//insertFront()：将一个元素添加到双端队列头部。 如果操作成功返回 true。
//insertLast()：将一个元素添加到双端队列尾部。如果操作成功返回 true。
//deleteFront()：从双端队列头部删除一个元素。 如果操作成功返回 true。
//deleteLast()：从双端队列尾部删除一个元素。如果操作成功返回 true。
//getFront()：从双端队列头部获得一个元素。如果双端队列为空，返回 -1。
//getRear()：获得双端队列的最后一个元素。 如果双端队列为空，返回 -1。
//isEmpty()：检查双端队列是否为空。
//isFull()：检查双端队列是否满了。
//
//示例：
//MyCircularDeque circularDeque = new MycircularDeque(3); // 设置容量大小为3
//circularDeque.insertLast(1);                    // 返回 true
//circularDeque.insertLast(2);                    // 返回 true
//circularDeque.insertFront(3);                    // 返回 true
//circularDeque.insertFront(4);                    // 已经满了，返回 false
//circularDeque.getRear();                  // 返回 2
//circularDeque.isFull();                        // 返回 true
//circularDeque.deleteLast();                    // 返回 true
//circularDeque.insertFront(4);                    // 返回 true
//circularDeque.getFront();                // 返回 4


// ***************************** 实现 ****************************** //
/// 提交时采用的是当前个数判断队空 队满问题；
/// 现在用空一个位置来判断队空队满；
 
class MyCircularDeque {

    var elements:[Int] = []
    var capacity: Int = 0
    var front: Int = 0
    var rear: Int = 0

    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        elements = Array.init(repeating: 0, count: k+1)
        capacity = k + 1
        front = 0
        rear = 0
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let nextFront = (front - 1 + capacity)%capacity
        elements[nextFront] = value
        front = nextFront
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        elements[rear] = value
        rear = (rear + 1)%capacity
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        elements[front] = 0
        front = (front + 1)%capacity
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        rear = (rear - 1 + capacity) % capacity
        elements[rear] = 0
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return elements[front]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        return elements[(rear - 1 + capacity) % capacity]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return front == rear // 相等即为空
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return (rear + 1) % capacity == front
    }
}


let obj = MyCircularDeque(3)
let ret_1: Bool = obj.insertLast(1)
let ret_2: Bool = obj.insertLast(2)
let ret_3: Bool = obj.insertFront(3)
let ret_4: Bool = obj.insertFront(4)
let ret_5: Int = obj.getRear()
let ret_6: Bool = obj.isFull()
let ret_7: Bool = obj.deleteLast()
let ret_8: Bool = obj.insertFront(4)
let ret_9: Int = obj.getFront()

print(ret_1)
print(ret_2)
print(ret_3)
print(ret_4)
print(ret_5)
print(ret_6)
print(ret_7)
print(ret_8)
print(ret_9)

