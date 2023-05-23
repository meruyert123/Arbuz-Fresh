import Foundation

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
    static let phonenumber = "^\\+?\\d{11}$"
    static let address = "[А-Яа-я0-9,.-]{1,}"
    static let digitRegex = "^[0-9]+$"
}
