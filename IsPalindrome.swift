// 125. 验证回文串
/**
如果在将所有大写字符转换为小写字符、并移除所有非字母数字字符之后，短语正着读和反着读都一样。则可以认为该短语是一个 回文串 。

字母和数字都属于字母数字字符。

给你一个字符串 s，如果它是 回文串 ，返回 true ；否则，返回 false 。

*/
// 思路：
// 1. 大写转小写
// 2. 过滤非字母
// 3. 双指针

func isPalindrome(_ s: String) -> Bool {
    // 大写转小写
    let s = s.lowercased()
    // 过滤非字母,数字
    let stArray = Array(s).filter { $0.isLetter || $0.isNumber }
    // 双指针
    var p = 0
    var q = stArray.count - 1
    while p < q {
        if stArray[p] != stArray[q] {
            return false
        }
        p += 1
        q -= 1
    }
    return true
}

assert(isPalindrome("A man, a plan, a canal: Panama") == true)
assert(isPalindrome("race a car") == false)
assert(isPalindrome(" ") == true)
assert(isPalindrome("0P") == false)
print("All tests passed!")
    