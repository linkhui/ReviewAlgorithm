// 栈相关的数据结构和算法
public struct Stack<T> {
    fileprivate var array: [T] = []

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: T) {
        array.append(element)
    }

    public mutating func pop() -> T? {
        return array.popLast()
    }

    public var top: T? {
        return array.last
    }

    public func printStack() {
        print(array)
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.printStack()
print(stack.top ?? "empty")
if let a = stack.pop() {
    print(a)
}
stack.printStack()
