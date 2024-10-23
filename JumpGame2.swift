// 45. 跳跃游戏 II

/**
给定一个长度为 n 的 0 索引整数数组 nums。初始位置为 nums[0]。

每个元素 nums[i] 表示从索引 i 向前跳转的最大长度。换句话说，如果你在 nums[i] 处，你可以跳转到任意 nums[i + j] 处:

0 <= j <= nums[i] 
i + j < n
返回到达 nums[n - 1] 的最小跳跃次数。生成的测试用例可以到达 nums[n - 1]。
*/

func jump(_ nums: [Int]) -> Int {
    // 初始化跳跃次数为0
    var jumps = 0
    // 初始化当前能跳到的最远位置为0
    var currentEnd = 0
    // 初始化下一步能跳到的最远位置为0
    var nextEnd = 0

    // 遍历数组中的每个元素 除了最后一个元素
    for i in 0..<nums.count - 1 {
        // 更新下一步能跳到的最远位置
        nextEnd = max(nextEnd, i + nums[i])

        // 如果当前位置是当前能跳到的最远位置
        if i == currentEnd {
            // 更新当前能跳到的最远位置
            currentEnd = nextEnd
            // 跳跃次数加1
            jumps += 1
        }
    }

    // 返回跳跃次数
    return jumps
}

print(jump([2,3,1,1,4])) // 2
print(jump([2,3,0,1,4])) // 2