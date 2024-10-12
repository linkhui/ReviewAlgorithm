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
}

class BTree {
    var root: BTreeNode?

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

// 查找不同的键
bTree.searchKey(12)  // 输出: Found key 12 in node with keys: [12]
bTree.searchKey(15)  // 输出: Key 15 not found in the B-tree.
