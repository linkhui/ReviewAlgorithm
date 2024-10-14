// main.swift

// Function to reverse a given string
func reverse(_ str: String) -> String {
    // Convert the string to an array of characters
    var charArray = Array(str)
    
    // Initialize pointers for the start and end of the array
    var begin = 0
    var end = charArray.count - 1
    
    // Swap characters from both ends until the pointers meet in the middle
    while begin < end {
        // Swap the characters
        let temp = charArray[begin]
        charArray[begin] = charArray[end]
        charArray[end] = temp
        
        // Move the pointers towards the center
        begin += 1
        end -= 1
    }
    
    // Convert the character array back to a string and return
    return String(charArray)
}

// Test the reverse function with the string "hello"
print(reverse("hello"))
