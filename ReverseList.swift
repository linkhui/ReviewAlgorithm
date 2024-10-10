/**
# ReverseList

This Swift file contains implementations for reversing a linked list and related utility functions.

## Contents

1. Node Class
2. Construct List Function
3. Print List Function
4. Reverse List Function

## Implementation Details

### Node Class

The `Node` class represents a single node in the linked list. Each node contains an integer value and a reference to the next node.

### Construct List Function

The `constructList` function creates a linked list from an array of integers.

### Print List Function

The `printList` function displays the contents of a linked list.

### Reverse List Function

The `reverseList` function reverses the order of nodes in a linked list.

*/

// 定义链表节点
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// 构造链表
func constructList(_ arr: [Int]) -> Node? {
    var head: Node? = nil
    var current: Node? = nil
    for value in arr {
        let newNode = Node(value: value, next: nil)
        if head == nil {
            head = newNode
            current = newNode
        } else {
            current?.next = newNode
            current = newNode
        }
    }
    return head
}

// 打印链表
func printList(_ head: Node?) {
    var current = head
    while current != nil {
        print(current!.value)
        current = current?.next
    }
}

// 反转链表（头插法）
func reverseList(_ head: Node?) -> Node? {
    // 定义当前节点，初始化为头节点
    var current = head
    // 定义新的头节点，初始化为nil
    var newHead: Node? = nil
    // 定义下一个节点，用于临时存储
    var next: Node? = nil
    
    // 遍历链表
    while current != nil {
        // 保存下一个节点
        next = current?.next
        // 将当前节点的next指向新的头节点，实现反转
        current?.next = newHead
        // 更新新的头节点为当前节点
        newHead = current
        // 移动到下一个节点
        current = next
    }
    
    // 返回反转后的新头节点
    return newHead
}


let head = constructList([1, 2, 3, 4, 5])
printList(head)
let reversedHead = reverseList(head)
printList(reversedHead)
