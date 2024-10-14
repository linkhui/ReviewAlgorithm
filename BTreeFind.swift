/**
 * B树查找
 * 用 Swift 实现的 B 树搜索算法。为了简化代码，
 * 假设 B 树的阶为 t = 3（即每个节点最多有 2 个键，最多 3 个子节点）。
 * B 树节点包含一个数组用于存储键值，以及一个数组存储子节点。
*/ 

class BTreeNode {
    var keys: [Int]  // 存储当前节点的键
    var children: [BTreeNode?]  // 存储当前节点的子节点
    var isLeaf: Bool  // 是否是叶节点

    init(isLeaf: Bool) {
        self.keys = []
        self.children = []
        self.isLeaf = isLeaf
    }

    // 判断当前节点是否已满
    func isFull(t: Int) -> Bool {
        print("keys.count: \(keys.count), 2 * t - 1: \(2 * t - 1)")
        return keys.count == 2 * t - 1
    }
}

class BTree {
    var root: BTreeNode?
    let t = 3  // B树的阶

    init() {
        root = nil
    }

    // B树查找函数
    func search(_ node: BTreeNode?, key: Int) -> BTreeNode? {
        guard let node = node else { return nil }

        // 在当前节点中查找键的位置
        var i = 0
        while i < node.keys.count && key > node.keys[i] {
            i += 1
        }

        // 如果找到键，返回该节点
        if i < node.keys.count && key == node.keys[i] {
            return node
        }

        // 如果是叶节点，说明找不到目标键
        if node.isLeaf {
            return nil
        }

        // 否则在适当的子树中递归查找
        return search(node.children[i], key: key)
    }

    // B树插入函数
    func insert(_ key: Int) {
        // 如果根节点为空，创建一个新节点
        if root == nil {
            root = BTreeNode(isLeaf: true)
            root?.keys.append(key)
        } else {
            // 如果根节点已满，需要分裂根节点并调整树结构
            if root!.isFull(t: t) {
                let newRoot = BTreeNode(isLeaf: false)
                newRoot.children.append(root)  // 旧根成为新根的子节点
                splitChild(newRoot, at: 0)  // 分裂旧根节点
                root = newRoot  // 更新根节点
            }
            // 插入键到非满节点中
            insertNonFull(node: root!, key: key)
        }
    }

    // 插入到非满节点的递归函数
    private func insertNonFull(node: BTreeNode, key: Int) {
        var i = node.keys.count - 1
        
        if node.isLeaf {
            // 在叶节点中插入键
            node.keys.append(key)  // 暂时放在最后
            while i >= 0 && key < node.keys[i] {
                node.keys[i + 1] = node.keys[i]  // 移动键以保持有序
                i -= 1
            }
            node.keys[i + 1] = key
        } else {
            // 找到要插入的子节点
            while i >= 0 && key < node.keys[i] {
                i -= 1
            }
            i += 1  // 找到插入的子节点位置

            if node.children[i]!.isFull(t: t) {
                // 如果子节点满了，先分裂子节点
                print("分裂子节点: \(i)")
                splitChild(node, at: i)
                if key > node.keys[i] {
                    i += 1
                }
            }
            insertNonFull(node: node.children[i]!, key: key)
        }
    }

    // 分裂满节点
    private func splitChild(_ parent: BTreeNode, at index: Int) {
        guard let fullChild = parent.children[index] else {
            print("Error: Child node at index \(index) is nil")
            return
        }
        let newNode = BTreeNode(isLeaf: fullChild.isLeaf)
        let midIndex = t - 1  // 中间的键将上移到父节点

        // 将右半部分的键分配给新节点
        newNode.keys = Array(fullChild.keys[midIndex+1..<fullChild.keys.count])
        let middleKey = fullChild.keys[midIndex]
        fullChild.keys = Array(fullChild.keys[0..<midIndex])
        
        if !fullChild.isLeaf {
            // 将右半部分的子节点分配给新节点
            newNode.children = Array(fullChild.children[midIndex+1..<fullChild.children.count])
            fullChild.children = Array(fullChild.children[0...midIndex])
        }

        // 将中间的键插入父节点
        parent.keys.insert(middleKey, at: index)
        parent.children.insert(newNode, at: index + 1)

        print("Split completed. Parent keys: \(parent.keys), FullChild keys: \(fullChild.keys), NewNode keys: \(newNode.keys)")
    }

    // 打印B树
    func printTree() {
        printTree(root, level: 0, prefix: "")
    }

    private func printTree(_ node: BTreeNode?, level: Int, prefix: String) {
        guard let node = node else { return }
        
        print("\(prefix)Level \(level): \(node.keys)")
        
        for (index, child) in node.children.enumerated() {
            let isLast = index == node.children.count - 1
            let newPrefix = prefix + (isLast ? "    " : "│   ")
            let childPrefix = prefix + (isLast ? "└── " : "├── ")
            
            print("\(childPrefix)↓")
            printTree(child, level: level + 1, prefix: newPrefix)
        }
    }

    // 打印查找结果
    func searchKey(_ key: Int) {
        if let resultNode = search(root, key: key) {
            print("Found key \(key) in node with keys: \(resultNode.keys)")
        } else {
            print("Key \(key) not found in the B-tree.")
        }
    }
}

// 创建一个简单的B树节点并手动插入一些键值
let root = BTreeNode(isLeaf: false)
root.keys = [10, 20]
let leftChild = BTreeNode(isLeaf: true)
leftChild.keys = [5, 7]
let middleChild = BTreeNode(isLeaf: true)
middleChild.keys = [12]
let rightChild = BTreeNode(isLeaf: true)
rightChild.keys = [25, 30]

// 连接子节点
root.children = [leftChild, middleChild, rightChild]

// 创建B树并设置根节点
let bTree = BTree()
bTree.root = root

// 打印B树
bTree.printTree()

// 查找不同的键
bTree.searchKey(12)  // 输出: Found key 12 in node with keys: [12]
bTree.searchKey(15)  // 输出: Key 15 not found in the B-tree.

// 插入
bTree.insert(15)
bTree.printTree()

bTree.insert(16)
bTree.printTree()
bTree.insert(17)
bTree.printTree()
bTree.insert(18)
bTree.printTree()
bTree.insert(19)
bTree.printTree()
// bTree.insert(21)
// bTree.insert(22)
bTree.searchKey(15)  // 输出: Found key 15 in node with keys: [15]


bTree.insert(2)
bTree.printTree()


// 使用for循环插入
for i in 1...100 {
    bTree.insert(i)
}
bTree.printTree()

bTree.searchKey(93)
