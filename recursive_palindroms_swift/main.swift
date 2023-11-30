func isPalindrome(_ str: String) -> Bool {
    let cleanedString = str.lowercased().filter { $0.isLetter }
    return checkPalindrome(cleanedString, cleanedString.startIndex, cleanedString.index(before: cleanedString.endIndex))
}

func checkPalindrome(_ str: String, _ firstIndex: String.Index, _ lastIndex: String.Index) -> Bool {
    if firstIndex >= lastIndex {
        return true
    }

    if str[firstIndex] != str[lastIndex] {
        return false
    }

    return checkPalindrome(str, str.index(after: firstIndex), str.index(before: lastIndex))
}

let tests = ["A man a plan a canal Panama", "homeemoh", "Hello", " GOd Dog"]

for input in tests {
    let result = isPalindrome(input)
    print("'\(input)' is a palindrome: \(result)")
}
