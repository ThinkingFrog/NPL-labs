func isPalindrome(_ str: String) -> Bool {
    let cleanedString = str.lowercased().filter { $0.isLetter }
    return checkPalindrome(cleanedString)
}

func checkPalindrome(_ str: String) -> Bool {
    if str.count <= 1 {
        return true
    }

    if str.first! != str.last! {
        return false;
    }

    let substring = String(str.dropFirst().dropLast())
    return checkPalindrome(substring)
}

let tests = ["A man a plan a canal Panama", "homeemoh", "Hello", " GOd Dog"]

for input in tests {
    let result = isPalindrome(input)
    print("'\(input)' is a palindrome: \(result)")
}
