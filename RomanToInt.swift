// 13. 罗马数字转整数

class Solution {
    func romanToInt(_ s: String) -> Int {
        // 1. 建立罗马数字到整数的映射
        let map: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var result = 0
        // 将字符串转换为字符数组，便于遍历
        let characters = Array(s)
        
        // 2. 遍历罗马数字字符串
        for i in 0..<characters.count {
            if let currentValue = map[characters[i]] {
                // 3. 检查是否需要减法规则
                // 如果当前字符的值小于下一个字符的值，则需要减去当前值
                if i + 1 < characters.count, 
                   let nextValue = map[characters[i + 1]], 
                   currentValue < nextValue {
                    result -= currentValue
                } else {
                    // 4. 如果不需要减法规则，直接加上当前值
                    result += currentValue
                }
            }
        }
        
        // 5. 返回最终结果
        return result
    }
}

assert(Solution().romanToInt("III") == 3)
assert(Solution().romanToInt("IV") == 4)
assert(Solution().romanToInt("IX") == 9)
assert(Solution().romanToInt("LVIII") == 58)
assert(Solution().romanToInt("MCMXCIV") == 1994)

