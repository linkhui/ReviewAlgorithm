// 队列

// 队列是一种线性数据结构，遵循先进先出（FIFO）的原则。
// 队列的基本操作包括：
// - 入队（enqueue）：将元素添加到队列的末尾。
// - 出队（dequeue）：从队列的头部移除元素。
// - 查看队列的头部元素（peek）：返回队列的头部元素，但不移除它。
// - 检查队列是否为空（isEmpty）：判断队列是否没有任何元素。
// - 获取队列的长度（size）：返回队列中元素的数量。

// 队列的实现通常有两种方式：数组和链表。
// 使用数组实现队列时，入队操作在数组末尾添加元素，出队操作在数组头部移除元素。
//      入队操作的时间复杂度是 O(1)
//      出队操作的时间复杂度是 O(n)
// 使用链表实现队列时，入队操作在链表尾部添加节点，出队操作在链表头部移除节点。
//      入队操作的时间复杂度是 O(1)
//      出队操作的时间复杂度是 O(1)

// 下面是一个使用数组实现队列的示例：

struct Queue<T> {
    private var elements: [T] = []

    // 入队
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    // 出队
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    // 查看队列的头部元素
    func peek() -> T? {
        return elements.first
    }

    // 检查队列是否为空
    func isEmpty() -> Bool {
        return elements.isEmpty
    }

    // 获取队列的长度
    func size() -> Int {
        return elements.count
    }

    // 打印队列
    func printQueue() {
        print(elements)
    }
}

// 示例用法
print("使用数组实现队列")
var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.printQueue() // 输出: [1, 2, 3]
print(queue.dequeue() ?? "队列已空") // 输出: 1
print(queue.peek() ?? "队列已空") // 输出: 2
print(queue.size()) // 输出: 2
print(queue.isEmpty()) // 输出: false

private class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

// 使用链表实现队列
struct QueueOfLinkedList<T> {

    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: Int = 0
    
    // 入队
    mutating func enqueue(_ element: T) {
        let newNode = Node(value: element)
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            tail!.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    // 出队
    mutating func dequeue() -> T? {
        guard let headNode = head else { return nil }
        head = headNode.next
        if head == nil {
            tail = nil
        }
        count -= 1
        return headNode.value
    }
    
    // 查看队列的头部元素
    func peek() -> T? {
        return head?.value
    }
    
    // 检查队列是否为空
    func isEmpty() -> Bool {
        return head == nil
    }
    
    // 获取队列的长度
    func size() -> Int {
        return count
    }
    
    // 打印队列
    func printQueue() {
        var current = head
        var elements: [T] = []
        while let node = current {
            elements.append(node.value)
            current = node.next
        }
        print(elements)
    }
}

// 示例用法
print("使用链表实现队列")
var queueOfLinkedList = QueueOfLinkedList<Int>()
queueOfLinkedList.enqueue(1)
queueOfLinkedList.enqueue(2)
queueOfLinkedList.enqueue(3)
queueOfLinkedList.printQueue() // 输出: [1, 2, 3]
print(queueOfLinkedList.dequeue() ?? "队列已空") // 输出: 1
print(queueOfLinkedList.peek() ?? "队列已空") // 输出: 2
print(queueOfLinkedList.size()) // 输出: 2
print(queueOfLinkedList.isEmpty()) // 输出: false
    
    

