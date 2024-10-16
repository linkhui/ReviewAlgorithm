// 归并排序

// 归并排序是一种基于分治法的排序算法，它将数组分成两个子数组，分别对两个子数组进行排序，然后将两个子数组合并成一个有序数组。
// 归并排序的时间复杂度为 O(n log n)，空间复杂度为 O(n)。
// 归并排序的优点是：稳定性好，时间复杂度稳定，适用于大规模数据排序。
// 归并排序的缺点是：需要额外的空间，空间复杂度为 O(n)。

// 拆分过程：将数组拆分成两个子数组，直到每个子数组只有一个元素。
// 合并过程：将两个有序的子数组合并成一个有序数组。


// 归并排序的实现
func MergeSort<T: Comparable>(array: [T]) -> [T] {
    // 如果数组长度小于等于1，直接返回
    if array.count <= 1 {
        return array
    }
    
    // 分割数组
    let mid = array.count / 2
    let leftArray = MergeSort(array: Array(array[..<mid]))
    let rightArray = MergeSort(array: Array(array[mid...]))
    
    // 合并数组
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var result = [T]()
    var leftIndex = 0
    var rightIndex = 0
    
    // 合并两个有序数组
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            result.append(leftArray[leftIndex])
            leftIndex += 1
        } else {
            result.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }

    // 将剩余的元素添加到结果数组中
    result.append(contentsOf: leftArray[leftIndex...])
    result.append(contentsOf: rightArray[rightIndex...])
    
    return result
}

let array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
let sortedArray = MergeSort(array: array)
print(sortedArray) // 输出: [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]


// 非递归的实现
func mergeSortBottomUp<T: Comparable>(_ array: inout [T]) {
    let n = array.count
    var size = 1
    
    while size < n {
        for start in stride(from: 0, to: n - size, by: size * 2) {
            let mid = start + size
            let end = min(start + size * 2, n)
            merge(&array, start, mid, end)
        }
        size *= 2
    }
}

func merge<T: Comparable>(_ array: inout [T], _ start: Int, _ mid: Int, _ end: Int) {
    let leftArray = Array(array[start..<mid])
    let rightArray = Array(array[mid..<end])
    
    var i = 0, j = 0, k = start
    
    while i < leftArray.count && j < rightArray.count {
        if leftArray[i] <= rightArray[j] {
            array[k] = leftArray[i]
            i += 1
        } else {
            array[k] = rightArray[j]
            j += 1
        }
        k += 1
    }
    
    while i < leftArray.count {
        array[k] = leftArray[i]
        i += 1
        k += 1
    }
    
    while j < rightArray.count {
        array[k] = rightArray[j]
        j += 1
        k += 1
    }
}

// 测试非递归的归并排序
var array2 = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
mergeSortBottomUp(&array2)
print(array2) // 输出: [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
