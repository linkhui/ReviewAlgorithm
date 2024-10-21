// 移除重复元素

class Solution {
/**
给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
*/  
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        
        var k = 1
        for i in 1..<nums.count {
            if nums[i] != nums[k-1] {
                nums[k] = nums[i]
                k += 1
            }
        }
        return k
    }

/**
给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 最多出现两次 ，返回删除后数组的新长度。

不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
*/
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        
        var k = 2
        for i in 2..<nums.count {
            if nums[i] != nums[k-1] || nums[i] != nums[k-2] {
                nums[k] = nums[i]
                k += 1
            }
        }
        return k
    }
}

let solution = Solution()
var nums = [1,1,2]
let k = solution.removeDuplicates(&nums)
print(k)
print(nums)
assert(k == 2)
assert(Array(nums[..<k]) == [1,2])

nums = [0,0,1,1,1,2,2,3,3,4]
let k2 = solution.removeDuplicates(&nums)
print(k2)
print(nums)
assert(k2 == 5)
assert(Array(nums[..<k2]) == [0,1,2,3,4])

nums = [1,1,1,2,2,3]
let k3 = solution.removeDuplicates2(&nums)
print(k3)
print(nums)
assert(k3 == 5)
assert(Array(nums[..<k3]) == [1,1,2,2,3])

nums = [1,1,1,2,2,2,3,3,4]
let k4 = solution.removeDuplicates2(&nums)
print(k4)
print(nums)
assert(k4 == 7)
assert(Array(nums[..<k4]) == [1,1,2,2,3,3,4])