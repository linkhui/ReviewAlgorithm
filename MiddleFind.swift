// 求无序数组的中位数

func MiddleFind(_ nums: inout [Int]) -> Int {
    let low = 0
    let high = nums.count - 1
    let mid = (low + high) / 2
    var div = PartSort(nums: &nums, start: low, end: high)
    while div != mid {
        if div > mid {
            div = PartSort(nums: &nums, start: low, end: div - 1)
        } else {
            div = PartSort(nums: &nums, start: div + 1, end: high)
        }
    }
    return nums[div]
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
            let temp = nums[low]
            nums[low] = nums[high]
            nums[high] = temp
        }
    }

    let temp = nums[low]
    nums[low] = nums[end]
    nums[end] = temp

    return low
}


var nums = [3, 1, 2, 4, 5, 6, 7, 8, 9]
let middleNumber = MiddleFind(&nums)
print(middleNumber)
