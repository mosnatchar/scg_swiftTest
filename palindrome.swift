// ข้อ 2
import Foundation
// let exampleString = "askka"
  //       if isPalindrome(exampleString) {
  //           print("\"\(exampleString)\" is a palindrome")
  //       } else {
  //           print("\"\(exampleString)\" is not a palindrome")
  //       }
 func isPalindrome(_ str: String) -> Bool {
        let cleanedStr = str.lowercased().filter { $0.isLetter }
        return cleanedStr == String(cleanedStr.reversed())
}
