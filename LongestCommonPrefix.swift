// 14. 最长公共前缀

// 编写一个函数来查找字符串数组中的最长公共前缀。
// 如果不存在公共前缀，返回空字符串 ""。

class Solution {
     func longestCommonPrefix(_ strs: [String]) -> String {
        // 如果输入数组为空，直接返回空字符串
        guard strs.count > 0 else { return "" }
        
        // 从第一个字符串的第一个字符开始比较
        var sIndex = strs[0].startIndex
        
        // 遍历第一个字符串的每个字符
        while sIndex < strs[0].endIndex {
            // 与其他所有字符串比较当前位置的字符
            for i in 1..<strs.count {
                // 如果当前字符串已经到达末尾，或者字符不匹配
                if sIndex >= strs[i].endIndex || strs[0][sIndex] != strs[i][sIndex] {
                    // 返回到当前位置为止的子串
                    // 使用String转换是因为Swift中的字符串切片(Substring)不能直接作为String返回
                    // 需要显式地将Substring转换为String以满足函数的返回类型要求
                    return String(strs[0][..<sIndex])
                }
            }
            // 移动到下一个字符
            sIndex = strs[0].index(after: sIndex)
        }
        
        // 如果第一个字符串的所有字符都匹配，返回整个第一个字符串
        return String(strs[0][..<sIndex])
    }

    // 优化前算法点评:
    
    // 1. 算法正确性:
    // 该算法正确实现了查找最长公共前缀的逻辑。它通过遍历第一个字符串的每个字符，并与其他所有字符串的对应位置进行比较。
    
    // 2. 时间复杂度:
    // 时间复杂度为O(S)，其中S是所有字符串中字符的总数。在最坏情况下，需要比较输入数组中所有字符串的所有字符。
    
    // 3. 空间复杂度:
    // 空间复杂度为O(1)，因为只使用了常数级别的额外空间。
    
    // 4. 算法思路:
    // 算法采用了逐字符比较的方法，从第一个字符串的第一个字符开始，逐一与其他字符串的对应位置进行比较。
    // 这种方法直观且易于理解，特别适合处理较短的字符串数组。
    
    // 5. 代码质量:
    // 代码结构清晰，使用了Swift的字符串API，如startIndex、endIndex和index(after:)等。
    // 注释详细，解释了关键步骤和Swift特定的处理（如Substring到String的转换）。
    
    // 6. 可优化点:
    // a. 对于非常长的字符串，可以考虑使用二分查找来加速查找过程。
    // b. 如果输入数组中有很多字符串，可以先排序，然后只比较第一个和最后一个字符串，这样可以减少比较次数。
    // c. 对于大规模输入，可以考虑并行处理，同时比较多个字符串。
    
    // 总体来说，这是一个直观、正确且易于理解的实现，适合大多数常见情况。
    // 对于特定的大规模输入场景，可能需要进一步优化以提高效率。

    func longestCommonPrefixOptimized(_ strs: [String]) -> String {
        // 如果输入数组为空，直接返回空字符串
        guard strs.count > 0 else { return "" }
        
        // 初始化最长公共前缀为第一个字符串
        var s0 = strs[0]
        
        // 遍历数组中的其他字符串
        for i in 1..<strs.count {
            // 当当前字符串不以s0为前缀时，持续移除s0的最后一个字符
            while !strs[i].hasPrefix(s0) {
                s0.removeLast()
            }
            
            // 如果s0变为空字符串，说明没有公共前缀，直接返回
            if s0.isEmpty {
                return ""
            }
        }
        
        // 返回最终的最长公共前缀
        return s0
    }

    // 优化后算法点评:

    // 1. 算法正确性:
    // 该算法正确实现了查找最长公共前缀的逻辑。它通过遍历数组中的每个字符串，并不断移除第一个字符串的最后一个字符，直到找到一个所有字符串都以该字符串为前缀为止。

    // 2. 时间复杂度:
    // 时间复杂度为O(S)，其中S是所有字符串中字符的总数。在最坏情况下，需要比较输入数组中所有字符串的所有字符。

    // 3. 空间复杂度:
    // 空间复杂度为O(1)，因为只使用了常数级别的额外空间。

    // 4. 算法思路:
    // 算法采用了不断移除第一个字符串的最后一个字符的方法，直到找到一个所有字符串都以该字符串为前缀为止。
    // 这种方法特别适用于处理较短的字符串数组，因为它避免了逐字符比较的复杂度。

    // 5. 代码质量:
    // 代码结构清晰，使用了Swift的字符串API，如hasPrefix和removeLast。
    // 注释详细，解释了关键步骤和Swift特定的处理。

}

let solution = Solution()
assert(solution.longestCommonPrefix(["flower","flow","flight"]) == "fl")
assert(solution.longestCommonPrefix(["dog","racecar","car"]) == "")

assert(solution.longestCommonPrefixOptimized(["flower","flow","flight"]) == "fl")
assert(solution.longestCommonPrefixOptimized(["dog","racecar","car"]) == "")

print("All tests passed!")


