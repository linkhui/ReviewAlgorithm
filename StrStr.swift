// 28. 找出字符串中第一个匹配项的下标

// 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串的第一个匹配项的下标（下标从 0 开始）。
// 如果 needle 不是 haystack 的一部分，则返回 -1 。

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hArray = Array(haystack)
        let nArray = Array(needle)

        var h = 0
        var r = -1
        while h < hArray.count {
            if hArray[h] == nArray[0], h + nArray.count <= hArray.count {
                r = h
                var include = true
                for i in 0..<nArray.count {
                    if hArray[h+i] != nArray[i] {
                        include = false
                    }
                }
                if include {
                    return r
                }
            } 
            r = -1
            h += 1
        }
        return r
    }

    // 算法点评：

    // 1. 正确性：
    // 该算法正确实现了查找子串的功能，能够处理各种情况，包括完全匹配、部分匹配和不匹配的情况。

    // 2. 时间复杂度：
    // 最坏情况下的时间复杂度为 O(m*n)，其中 m 是 haystack 的长度，n 是 needle 的长度。
    // 这是因为对于 haystack 中的每个字符（最多 m 个），都可能需要比较整个 needle 字符串（n 个字符）。

    // 3. 空间复杂度：
    // 空间复杂度为 O(m+n)，因为我们将两个字符串转换为了字符数组。
    // 可以通过直接使用字符串索引来优化空间复杂度到 O(1)。

    // 4. 可优化点：
    // a. 可以使用更高效的字符串匹配算法，如 KMP 算法，将时间复杂度降低到 O(m+n)。
    // b. 可以直接使用字符串索引而不是转换为数组，以节省空间。
    // c. 可以在找到不匹配的字符时立即跳出内层循环，避免不必要的比较。

    // 5. 代码风格：
    // 代码结构清晰，变量命名简洁。但可以考虑添加更多的注释来解释算法的关键步骤。

    // 6. 其他建议：
    // 考虑处理边界情况，如空字符串的输入。
    // 可以使用 Swift 的字符串 API（如 hasPrefix）来简化代码。

    // 优化后的实现：
    func strStrOptimized(_ haystack: String, _ needle: String) -> Int {
        // 如果 needle 为空字符串，直接返回 0
        guard !needle.isEmpty else { return 0 }
        // 如果 haystack 的长度小于 needle，不可能找到匹配，返回 -1
        guard haystack.count >= needle.count else { return -1 }
        
        let hCount = haystack.count
        let nCount = needle.count
        
        // 遍历 haystack 中所有可能的起始位置
        for i in 0...(hCount - nCount) {
            // 计算当前子串的起始索引
            let start = haystack.index(haystack.startIndex, offsetBy: i)
            // 计算当前子串的结束索引
            let end = haystack.index(start, offsetBy: nCount)
            // 比较当前子串与 needle
            if haystack[start..<end] == needle {
                // 如果匹配，返回起始索引
                return i
            }
        }
        
        // 如果没有找到匹配，返回 -1
        return -1
    }

    // 优化后的算法点评：

    // 1. 正确性：
    // 该优化后的算法正确实现了查找子串的功能，能够处理各种情况，包括完全匹配、部分匹配和不匹配的情况。

    // 2. 时间复杂度：
    // 时间复杂度为 O(m*n)，其中 m 是 haystack 的长度，n 是 needle 的长度。
    // 这是因为对于 haystack 中的每个字符（最多 m 个），都可能需要比较整个 needle 字符串（n 个字符）。

    // 3. 空间复杂度：
    // 空间复杂度为 O(1)，因为只使用了常数级别的额外空间。

    // 4. 算法思路：
    // 该算法通过遍历 haystack 中的每个可能的起始位置，并比较当前子串与 needle 来找到匹配。
    // 这种方法特别适用于处理较短的字符串数组，因为它避免了逐字符比较的复杂度。

    // 5. 代码风格：
    // 代码结构清晰，变量命名简洁。但可以考虑添加更多的注释来解释算法的关键步骤。

    // 6. 其他建议：
    // 考虑处理边界情况，如空字符串的输入。
    // 可以使用 Swift 的字符串 API（如 hasPrefix）来简化代码。

    
}

let solution = Solution()
assert(solution.strStr("hello", "ll") == 2)
assert(solution.strStr("aaaaa", "bba") == -1)
assert(solution.strStr("mississippi", "issip") == 4)

// 优化后的实现：
assert(solution.strStrOptimized("hello", "ll") == 2)
assert(solution.strStrOptimized("aaaaa", "bba") == -1)
assert(solution.strStrOptimized("mississippi", "issip") == 4)

print("all tests passed")
