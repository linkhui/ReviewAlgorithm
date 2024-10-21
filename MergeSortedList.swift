/**
 * MergeSortedList
 * 合并两个有序数组
 * 具体算法：
 * 1. 初始化两个指针，分别指向两个数组的起始位置
 * 2. 比较两个指针指向的元素，将较小的元素添加到结果数组中，并将指针向后移动
 * 3. 如果一个数组已经遍历完毕，将另一个数组剩余的元素添加到结果数组中
 * 4. 返回结果数组
 */

// 合并两个有序数组
func mergeList(_ l1: [Int], _ l2: [Int]) -> [Int] {
    // 初始化两个指针，分别指向两个数组的起始位置
    var i = 0
    var j = 0
    // 初始化结果数组
    var result = [Int]()
    
    // 比较两个指针指向的元素，将较小的元素添加到结果数组中
    while i < l1.count && j < l2.count {
        if l1[i] < l2[j] {
            result.append(l1[i])
            i += 1
        } else {
            result.append(l2[j])
            j += 1
        }
    }
    
    // 如果l1数组还有剩余元素，将它们添加到结果数组中
    while i < l1.count {
        result.append(l1[i])
        i += 1
    }
    
    // 如果l2数组还有剩余元素，将它们添加到结果数组中
    while j < l2.count {
        result.append(l2[j])
        j += 1
    }
    
    // 返回合并后的有序数组
    return result
}

let l1 = [1, 3, 5, 7]
let l2 = [2, 4, 6, 8]
let result = mergeList(l1, l2)
print(result)


class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = 0
        var j = 0
        var nums: [Int] = []
        while i < m, j < n {
            if nums1[i] < nums2[j] {
                nums.append(nums1[i])
                i += 1
            } else {
                nums.append(nums2[j])
                j += 1
            }
        }
        if i < m {
            for num in nums1[i..<m] {
                nums.append(num)
            }
        }
        if j < n {
            for num in nums2[j..<n] {
                nums.append(num)
            }
        }
        for k in 0..<(m + n) {
            nums1[k] = nums[k]
        }
    }

    // 设计实现一个时间复杂度为 O(m + n) 的算法
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var k = m + n - 1
        while i >= 0, j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1            
        }
        // 如果nums2数组还有剩余元素，将它们添加到nums1数组中
        if j >= 0 {
            for index in stride(from: j, through: 0, by: -1) {
                nums1[k] = nums2[index]
                k -= 1
            }
        }
    }
}

// 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
// 输出：[1,2,2,3,5,6]
let solution = Solution()
var nums1 = [1,2,3,0,0,0]
var m = 3
var nums2 = [2,5,6]
var n = 3
solution.merge(&nums1, m, nums2, n)
print(nums1)
// 检查输出是否正确
assert(nums1 == [1,2,2,3,5,6])

// 算法2
nums1 = [1,2,3,0,0,0]
solution.merge2(&nums1, m, nums2, n)
print(nums1)
assert(nums1 == [1,2,2,3,5,6])

// nums1为空
nums1 = [0]
m = 0
nums2 = [1]
n = 1
solution.merge2(&nums1, m, nums2, n)
print(nums1)
assert(nums1 == [1])

// nums2为空
nums1 = [1]
m = 1
nums2 = []
n = 0
solution.merge2(&nums1, m, nums2, n)
print(nums1)
assert(nums1 == [1])

// 用例3
nums1 = [4,5,6,0,0,0]
m = 3
nums2 = [1,2,3]
n = 3
solution.merge2(&nums1, m, nums2, n)
print(nums1)
assert(nums1 == [1,2,3,4,5,6])