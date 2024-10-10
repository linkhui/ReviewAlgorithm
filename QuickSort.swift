// 快速排序
func QuickSort(nums: inout [Int], start: Int, end: Int) {
    print("start: \(start), end: \(end)")
    print(nums)
    if start < end {
        let pivotIndex = PartSort(nums: &nums, start: start, end: end)
        print("pivotIndex: \(pivotIndex)")
        QuickSort(nums: &nums, start: start, end: pivotIndex - 1)
        QuickSort(nums: &nums, start: pivotIndex + 1, end: end)
    }
}

func PartSort(nums: inout [Int], start: Int, end: Int) -> Int {
    var low = start
    var high = end
    let pivot = nums[end]
    
    while low < high {
        while low < high && nums[low] < pivot {
            low += 1
        }
        while low < high && nums[high] > pivot {
            high -= 1
        }
        if low < high {
            nums.swapAt(low, high)
        }
    }
    return low
}

var nums = [3, 1, 2, 4, 5, 6, 7, 8, 9, 10]
QuickSort(nums: &nums, start: 0, end: nums.count - 1)
print(nums)