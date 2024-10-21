
/**
169. 多数元素
给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊n / 2⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。
*/
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        // 这个算法被称为 Boyer-Moore 投票算法
        var candidate = nums[0]  // 初始化候选元素为数组的第一个元素
        var count = 0  // 初始化计数器为0
        
        for num in nums {
            if count == 0 {
                // 如果计数器为0，说明之前的抵消已经完成，更新候选元素
                candidate = num
            }
            // 如果当前元素等于候选元素，计数器加1；否则减1
            count += (num == candidate) ? 1 : -1
        }
        
        // 由于题目保证存在多数元素，所以最后的候选元素就是多数元素
        return candidate
    }
}

// 算法解释：
// 1. 这个算法的核心思想是"抵消"。
// 2. 我们假设第一个元素是多数元素，然后遍历数组。
// 3. 如果遇到相同的元素，就增加计数；如果遇到不同的元素，就减少计数。
// 4. 当计数变为0时，我们就更换候选元素。
// 5. 由于多数元素的数量超过数组长度的一半，所以最后留下的候选元素必定是多数元素。
// 6. 这个算法的时间复杂度是O(n)，空间复杂度是O(1)，非常高效。

let solution = Solution()
var nums = [3, 2, 3]
var result = solution.majorityElement(nums)
print(result)
assert(result == 3)

nums = [2,2,1,1,1,2,2]
result = solution.majorityElement(nums)
print(result)
assert(result == 2)

// 解释这个用例的算法执行过程：
// 1. 初始化：candidate = 2, count = 0
// 2. 遍历数组 [2,2,1,1,1,2,2]：
//    - 2: count = 0, 更新 candidate = 2, count = 1
//    - 2: count = 2
//    - 1: count = 1
//    - 1: count = 0
//    - 1: count = 0, 更新 candidate = 1, count = 1
//    - 2: count = 0
//    - 2: count = 0, 更新 candidate = 2, count = 1
// 3. 遍历结束，最终 candidate = 2
// 4. 返回 2 作为多数元素
// 
// 这个例子展示了即使中间出现了连续的非多数元素（三个1），
// 算法仍然能够正确找出真正的多数元素（2）。
// 这是因为多数元素的出现次数总是多于其他所有元素，
// 所以在最后一定会"胜出"。

nums = [1]
result = solution.majorityElement(nums)
print(result)
assert(result == 1)

nums = [6, 5, 5]
result = solution.majorityElement(nums)
print(result)
assert(result == 5)
