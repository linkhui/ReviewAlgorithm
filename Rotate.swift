
// 189. 轮转数组
// 给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

class Solution {

    // 这个方法的不足之处：
    // 1. 时间复杂度高：O(k * n)，其中 n 是数组长度。对于大型数组和大的 k 值，性能会很差。
    // 2. 没有处理 k 大于数组长度的情况，可能会导致不必要的重复操作。
    // 3. 对于每次单个元素的移动都使用了一个完整的内部循环，这是非常低效的。
    // 4. 空间复杂度虽然是 O(1)，但时间效率的牺牲可能使这个优势变得不那么重要。
    // 5. 对于大型数组，这种方法可能会导致大量的内存写操作，影响性能。
    func rotate0(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        guard count > 1 else { return }
        for i in 0..<k {
            let last = nums[count - 1]
            for j in 1..<nums.count {
                nums[count - j] = nums[count - j - 1]
            }
            nums[0] = last
        }
    }
    

    // 方法1，改进点：
    // 1. 处理 k 大于数组长度的情况
    // 2. 使用额外空间来优化时间复杂度
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        guard count > 1 else { return }
        
        // 处理 k 大于数组长度的情况
        let effectiveK = k % count
        guard effectiveK != 0 else { return }
        
        // 使用额外空间来优化时间复杂度
        let rotated = Array(nums[count - effectiveK..<count] + nums[0..<count - effectiveK])
        nums = rotated
    }

    // 方法2
    func rotate2(_ nums: inout [Int], _ k: Int) {
        // 获取数组长度
        let count = nums.count
        // 如果数组长度小于等于1，无需旋转
        guard count > 1 else { return }
        // 计算有效的旋转步数，避免不必要的完整循环
        let effectiveK = k % count
        // 如果有效旋转步数为0，无需旋转
        guard effectiveK != 0 else { return }
        
        // 步骤1：反转整个数组
        nums.reverse()
        // 步骤2：反转前effectiveK个元素
        nums[0..<effectiveK].reverse()
        // 步骤3：反转剩余的元素
        nums[effectiveK..<count].reverse()
        
        // 这种方法的原理是：
        // 1. 先将整个数组反转，这样原本要移到末尾的元素就到了数组开头
        // 2. 然后将前effectiveK个元素反转，恢复它们的相对顺序
        // 3. 最后将剩余的元素反转，恢复它们的相对顺序
        // 这样就完成了数组的旋转，时间复杂度为O(n)，空间复杂度为O(1)
    }

    // 方法3 空间复杂度为 O(1) 的 原地 算法
    func rotate3(_ nums: inout [Int], _ k: Int) {
        // 获取数组长度
        let count = nums.count
        // 如果数组长度小于等于1，无需旋转
        guard count > 1 else { return }
        // 计算有效的旋转步数，避免不必要的完整循环
        let effectiveK = k % count
        // 如果有效旋转步数为0，无需旋转
        guard effectiveK != 0 else { return }
        
        var start = 0 // 记录起始位置
        var current = 0 // 当前处理的元素位置
        var prev = nums[current] // 保存当前位置的元素值
        var next = 0 // 下一个要处理的位置
        
        // 遍历数组中的每个元素
        for _ in 0..<count {
            // 计算下一个位置
            next = (current + effectiveK) % count
            // 暂存下一个位置的元素
            let temp = nums[next]
            // 将当前元素移动到下一个位置
            nums[next] = prev
            // 更新prev为下一个位置的原始元素
            prev = temp
            // 移动到下一个位置
            current = next
            
            // 如果回到起始位置，且还未处理完所有元素，则移动到下一个起始位置
            if current == start {
                start += 1
                current = start
                prev = nums[current]
            }
        }
    }
}

let solution = Solution()
var nums = [1, 2, 3, 4, 5, 6, 7]
solution.rotate(&nums, 3)
print(nums)
assert(nums == [5, 6, 7, 1, 2, 3, 4])


nums = [1, 2, 3, 4, 5, 6, 7]
solution.rotate2(&nums, 3)
print(nums)
assert(nums == [5, 6, 7, 1, 2, 3, 4])

nums = [1, 2, 3, 4, 5, 6, 7]
solution.rotate3(&nums, 3)
print(nums)
assert(nums == [5, 6, 7, 1, 2, 3, 4])
