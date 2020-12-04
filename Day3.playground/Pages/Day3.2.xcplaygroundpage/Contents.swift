//: [Previous](@previous)

import Foundation


var raw: String = ""
do {
    guard let fileUrl = Bundle.main.url(forResource: "day3", withExtension: "txt") else { fatalError() }
    let data = try Data(contentsOf: fileUrl)
    raw = String(data: data, encoding: .utf8) ?? ""

} catch {
    print(error)
}

let lines = raw.components(separatedBy: "\n")

func getTrees(x: Int, y: Int) -> Int {
    var treeCount = 0
    var column = 0
    let width = lines[0].count

    for index in stride(from: y, to: lines.count, by: y) {
        
        let element = lines[index]
        if column >= width {
            column -= width // back 0
        }
        
        if Array(element)[column] == "#" {
            treeCount += 1
        }
        
        column += x
        
        
    }

        return treeCount
}

var one = getTrees(x: 1, y: 1)
var two = getTrees(x: 3, y: 1)
var three = getTrees(x: 5, y: 1)
var four = getTrees(x: 7, y: 1)
var five = getTrees(x: 1, y: 2)

print(one * two * three * four * five)
