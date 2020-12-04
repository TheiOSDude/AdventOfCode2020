import UIKit


var raw: String = ""
do {
    guard let fileUrl = Bundle.main.url(forResource: "day3", withExtension: "txt") else { fatalError() }
    let data = try Data(contentsOf: fileUrl)
    raw = String(data: data, encoding: .utf8) ?? ""

} catch {
    print(error)
}

func getTrees(lines: [String], right: Int, down: Int) -> Int {
    var treeCount = 0
    var column = 0
    let width = lines[0].count

    for element in lines {
        
        if column >= width {
            column -= width // back 0
        }
        
        if Array(element)[column] == "#" {
            treeCount += 1
        }
        column += right
    }
    return treeCount
}

let lines = getTrees(lines: raw.components(separatedBy: "\n"), right: 3, down: 1)
