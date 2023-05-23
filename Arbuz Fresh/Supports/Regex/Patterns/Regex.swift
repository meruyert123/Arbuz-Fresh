import Foundation

enum RegexPatterns {
    static let phonenumber = "^\\+?\\d{11}$"
    static let address = "[А-Яа-я0-9,/]"
    static let digitRegex = "^[0-9]+$"
    static let alphanumericRegex = "[А-Яа-я]"
}
