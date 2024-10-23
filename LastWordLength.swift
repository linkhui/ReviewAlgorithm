// 58. 最后一个单词的长度

/**
给定一个字符串 s ，返回 最后一个单词的长度。

单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。
*/

// 方法一：使用 split 方法
func lengthOfLastWord(_ s: String) -> Int {
    return s.split(separator: " ").last?.count ?? 0
}


assert(lengthOfLastWord("Hello World") == 5)
assert(lengthOfLastWord("   fly me   to   the moon  ") == 4)
assert(lengthOfLastWord("luffy is still joyboy") == 6)


// 方法二：使用数组遍历
func lengthOfLastWord2(_ s: String) -> Int {
    let stArray = Array(s)
    var p = stArray.count - 1
    while p > 0 && stArray[p].isWhitespace {
        p -= 1
    }
    var l = 0 
    while p >= 0 && !stArray[p].isWhitespace {
        l += 1
        p -= 1
    }
    return l
}

assert(lengthOfLastWord2("Hello World") == 5)
assert(lengthOfLastWord2("   fly me   to   the moon  ") == 4)
assert(lengthOfLastWord2("luffy is still joyboy") == 6)

print("All tests passed!")


// 总结：
// 方法一：使用 split 方法，简单易懂，但性能较差
// 方法二：使用数组遍历，性能较好，但代码稍复杂