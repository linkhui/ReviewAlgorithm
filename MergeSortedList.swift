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