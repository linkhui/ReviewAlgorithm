// 383. 赎金信
// 给你两个字符串：ransomNote 和 magazine ，判断 ransomNote 能不能由 magazine 里面的字符构成。
// 如果可以，返回 true ；否则返回 false 。
// magazine 中的每个字符只能在 ransomNote 中使用一次。

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazineArray = Array(magazine)
        for char in ransomNote {
            if let index = magazineArray.firstIndex(of: char) {
                magazineArray.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
/*
    方法一：字符统计
题目要求使用字符串 magazine 中的字符来构建新的字符串 ransomNote，且ransomNote 中的每个字符只能使用一次，只需要满足字符串 magazine 中的每个英文字母 (’a’-’z’) 的统计次数都大于等于 ransomNote 中相同字母的统计次数即可。

如果字符串 magazine 的长度小于字符串 ransomNote 的长度，则我们可以肯定 magazine 无法构成 ransomNote，此时直接返回 false。
首先统计 magazine 中每个英文字母 a 的次数 cnt[a]，再遍历统计 ransomNote 中每个英文字母的次数，如果发现 ransomNote 中存在某个英文字母 c 的统计次数大于 magazine 中该字母统计次数 cnt[c]，则此时我们直接返回 false。
*/
    func canConstruct2(_ ransomNote: String, _ magazine: String) -> Bool {
        // 参考字符统计的算法实现
        if ransomNote.count > magazine.count {
            return false
        }
        var cnt = [Character: Int]()
        for char in magazine {
            cnt[char, default: 0] += 1
        }
        for char in ransomNote {
            if let count = cnt[char], count > 0 {
                cnt[char] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}

assert(Solution().canConstruct("a", "b") == false)
assert(Solution().canConstruct("aa", "ab") == false)
assert(Solution().canConstruct("aa", "aab") == true)

assert(Solution().canConstruct2("a", "b") == false)
assert(Solution().canConstruct2("aa", "ab") == false)
assert(Solution().canConstruct2("aa", "aab") == true)

print("All tests passed!")

