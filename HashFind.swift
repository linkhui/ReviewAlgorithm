// 在一个字符串中找到第一个只出现一次的字符
func findFirstUniqueChar(_ s: String) -> Character? {
    // 创建一个字典来存储每个字符出现的次数
    var charCount = [Character: Int]()
    
    // 第一次遍历字符串，统计每个字符出现的次数
    for char in s {
        charCount[char, default: 0] += 1
    }
    
    // 第二次遍历字符串，找到第一个出现次数为1的字符
    for char in s {
        if charCount[char] == 1 {
            return char
        }
    }
    
    // 如果没有找到只出现一次的字符，返回nil
    return nil
}

let s = "leetcode"
if let result = findFirstUniqueChar(s) {
    print("第一个只出现一次的字符是: \(result)")
} else {
    print("没有只出现一次的字符")
}

