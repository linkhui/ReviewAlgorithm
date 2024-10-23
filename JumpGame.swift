// 55. 跳跃游戏
// 给定一个非负整数数组 nums，你最初位于数组的第一个下标。
// 数组中的每个元素代表你在该位置可以跳跃的最大长度。
// 判断你是否能够到达最后一个下标。

func canJump(_ nums: [Int]) -> Bool {
    // 初始化最远可达位置为0
    var maxReach = 0
    
    // 遍历数组中的每个元素
    for i in 0..<nums.count {
        // 如果当前索引大于最远可达位置，说明无法到达当前位置
        if i > maxReach {
            return false
        }
        
        // 更新最远可达位置
        // 取当前最远可达位置和从当前位置能跳到的最远位置的较大值
        maxReach = max(maxReach, i + nums[i])
    }
    
    // 如果遍历完整个数组都没有返回false，说明可以到达最后一个位置
    return true
}

// 算法原理解释：
// 1. 我们使用一个变量 maxReach 来记录当前能够到达的最远位置。
// 2. 遍历数组中的每个元素：
//    a. 如果当前索引 i 大于 maxReach，说明无法到达当前位置，返回 false。
//    b. 否则，更新 maxReach 为当前能到达的最远位置和之前的 maxReach 中的较大值。
// 3. 如果遍历完整个数组都没有返回 false，说明可以到达最后一个位置，返回 true。
// 
// 这个算法的时间复杂度是 O(n)，其中 n 是数组的长度，因为我们只遍历了一次数组。
// 空间复杂度是 O(1)，因为我们只使用了常数级的额外空间。

// 为什么使用最远到达（maxReach）能解决这个问题？

// 1. 问题的本质：
//    这个问题的核心是判断是否能从起点跳到终点。我们需要在每一步都确保能够继续前进。

// 2. maxReach 的含义：
//    maxReach 代表了在当前遍历过的所有位置中，能够到达的最远距离。
//    它综合了之前所有位置的跳跃能力。

// 3. 贪心策略：
//    我们不需要考虑具体的跳跃路径，只需要知道能否到达即可。
//    因此，我们总是选择能到达的最远位置，这是一种贪心策略。

// 4. 有效性判断：
//    如果当前位置 i 大于 maxReach，说明无法到达当前位置，也就无法继续前进。
//    这是算法中的关键判断条件：if i > maxReach { return false }

// 5. 动态更新：
//    每到达一个新位置，我们都更新 maxReach。
//    maxReach = max(maxReach, i + nums[i]) 确保了我们始终知道能到达的最远位置。

// 6. 终止条件：
//    如果遍历完整个数组都没有返回 false，说明 maxReach 始终大于或等于当前位置，
//    也就意味着我们能够到达最后一个位置。

// 7. 效率：
//    这种方法只需要遍历一次数组，时间复杂度为 O(n)，非常高效。

// 总结：
// 使用 maxReach 的方法巧妙地将"是否能到达终点"转化为"在每一步是否能继续前进"的问题。
// 它利用了问题的特性，避免了复杂的路径计算，实现了高效的解决方案。



print(canJump([2,3,1,1,4])) // true

// 让我们详细解释一下 [2,3,1,1,4] 在算法中的执行过程：

// 初始状态：maxReach = 0

// i = 0: nums[0] = 2
//   maxReach = max(0, 0 + 2) = 2
//   现在我们可以到达索引 2

// i = 1: nums[1] = 3
//   1 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(2, 1 + 3) = 4
//   现在我们可以到达索引 4

// i = 2: nums[2] = 1
//   2 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(4, 2 + 1) = 4
//   maxReach 没有变化，仍然是 4

// i = 3: nums[3] = 1
//   3 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(4, 3 + 1) = 4
//   maxReach 没有变化，仍然是 4

// i = 4: nums[4] = 4
//   4 <= maxReach，所以我们可以到达这个位置
//   这是数组的最后一个元素，我们已经成功到达

// 因为我们能够遍历整个数组而没有返回 false，
// 所以函数返回 true，表示我们可以到达最后一个位置。

print(canJump([3,2,1,0,4])) // false

// 让我们详细解释一下 [3,2,1,0,4] 在算法中的执行过程：

// 初始状态：maxReach = 0

// i = 0: nums[0] = 3
//   maxReach = max(0, 0 + 3) = 3
//   现在我们可以到达索引 3

// i = 1: nums[1] = 2
//   1 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(3, 1 + 2) = 3
//   maxReach 没有变化，仍然是 3

// i = 2: nums[2] = 1
//   2 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(3, 2 + 1) = 3
//   maxReach 没有变化，仍然是 3

// i = 3: nums[3] = 0
//   3 <= maxReach，所以我们可以到达这个位置
//   maxReach = max(3, 3 + 0) = 3
//   maxReach 没有变化，仍然是 3

// i = 4: nums[4] = 4
//   4 > maxReach，所以我们无法到达这个位置
//   函数返回 false

// 因为我们在到达最后一个元素之前就返回了 false，
// 所以函数最终返回 false，表示我们无法到达最后一个位置。

////
// 最早开始位置算法

func canJump2(_ nums: [Int]) -> Bool {
    var lastPos = nums.count - 1
    for i in (0..<nums.count).reversed() {
        if i + nums[i] >= lastPos {
            lastPos = i
        }
    }
    return lastPos == 0
}

print(canJump2([2,3,1,1,4])) // true
print(canJump2([3,2,1,0,4])) // false
