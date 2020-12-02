import UIKit
import Foundation

struct Password {
    var range: String
    var requiredChar: String
    var password: String
    
    var minimum: Int {
        return Int(String(range.split(separator: "-").first ?? "10000")) ?? 10000
    }
    var maximum: Int {
        return Int(String(range.split(separator: "-").last ?? "0")) ?? 0
    }
    var isValid: Bool {
        var count = 0
        for char in password {
            if char == Character(requiredChar) {
                count += 1
            }
        }
        print(count)
        return count >= minimum && count <= maximum
    }
}

var raw: String = ""
do {
    guard let fileUrl = Bundle.main.url(forResource: "day2", withExtension: "txt") else { fatalError() }
    let data = try Data(contentsOf: fileUrl)
    raw = String(data: data, encoding: .utf8) ?? ""

} catch {
    print(error)
}

var lines: [String] = []
raw.enumerateLines { line, _ in
    lines.append(line)
}

var passwords = [String]()
let split: [Password] = lines.compactMap { $0
    let processed = $0.split(separator: " ")
    guard processed.count == 3 else {
        return nil
    }
    
    let range = String(processed[0])
    let required = String(processed[1])
    let requiredREplace = required.replacingOccurrences(of: ":", with: "")
    let password = String(processed[2])
    
    return Password(range: range, requiredChar: requiredREplace, password: password)
}

let c = split.filter { $0.isValid}.count
print(c)


