// main.swift

func reverse(_ str: String) -> String {
    var charArray = [Character]()
    charArray = Array(str)
    var begin = 0
    var end = charArray.count - 1
    while begin < end {
        let temp = charArray[begin]
        charArray[begin] = charArray[end]
        charArray[end] = temp
        begin += 1
        end -= 1
    }
    return String(charArray)
}

print(reverse("hello"))
