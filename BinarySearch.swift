// 二分搜索
// 使用迭代的方式实现

func BinarySearch<T: Comparable>(array: [T], target: T) -> Int? {
    // 初始化左右指针
    var left = 0
    var right = array.count - 1

    // 当左指针小于等于右指针时，继续搜索
    while left <= right {
        // 计算中间索引
        let mid = (left + right) / 2
        
        // 如果中间元素等于目标值，返回索引
        if array[mid] == target {
            return mid
        }
        
        // 如果中间元素小于目标值，在右半部分继续搜索
        if array[mid] < target {
            left = mid + 1
        } else {
            // 如果中间元素大于目标值，在左半部分继续搜索
            right = mid - 1
        }
    }
    
    // 如果没有找到目标值，返回 nil
    return nil
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let target = 5
let result = BinarySearch(array: array, target: target)
print(result ?? "Not found") // 输出: 4
