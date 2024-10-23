// 392. 判断子序列

/**
给你两个字符串 s 和 t ，判断 s 是否为 t 的子序列。

字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。

进阶：

如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
*/

class Solution {
    // 1. 双指针
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sa = Array(s)
        let ta = Array(t)
        var p = 0
        for i in 0..<sa.count {
            var include = false
            for j in p..<ta.count {
                if sa[i] == ta[j] {
                    p = j + 1
                    include = true
                    break
                }
            }
            if !include {
                return false
            }
        }        
        return true
    }
    // 分析点评:
    
    // 1. 算法正确性:
    // 该算法正确实现了判断子序列的逻辑。它通过双指针遍历两个字符串，确保s中的每个字符都按顺序出现在t中。
    
    // 2. 时间复杂度:
    // 最坏情况下的时间复杂度是O(m*n)，其中m和n分别是s和t的长度。
    // 这是因为对于s中的每个字符(最多m个)，可能需要遍历整个t字符串(最多n个字符)。
    
    // 3. 空间复杂度:
    // 空间复杂度为O(m+n)，因为我们将字符串转换为了字符数组。
    // 如果直接使用字符串索引，可以将空间复杂度优化到O(1)。
    
    // 4. 可优化点:
    // a. 可以直接使用字符串索引而不是转换为数组，以节省空间。
    // b. 可以使用一个指针而不是两个循环，简化代码结构。
    // c. 对于进阶问题(大量输入的情况)，可以预处理t字符串，建立每个字符最后出现位置的映射，
    //    这样可以快速跳过不必要的比较，将时间复杂度优化到O(m+n)。
    
    // 5. 代码风格:
    // 代码结构清晰，变量命名简洁。可以考虑添加更多的注释来解释算法的关键步骤。
    
    // 优化后的实现:
    func isSubsequenceOptimized(_ s: String, _ t: String) -> Bool {
        var sIndex = s.startIndex
        var tIndex = t.startIndex
        
        while sIndex < s.endIndex && tIndex < t.endIndex {
            if s[sIndex] == t[tIndex] {
                sIndex = s.index(after: sIndex)
            }
            tIndex = t.index(after: tIndex)
        }
        
        return sIndex == s.endIndex
    }
}



assert(Solution().isSubsequence("abc", "ahbgdc") == true)
assert(Solution().isSubsequence("axc", "ahbgdc") == false)

assert(Solution().isSubsequenceOptimized("abc", "ahbgdc") == true)
assert(Solution().isSubsequenceOptimized("axc", "ahbgdc") == false)

print("All tests passed!")