//
//  Spreadsheet.swift
//  Flyweight
//
//  Created by Rocky on 2018/1/24.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation
import CoreLocation


class Coordinate: Hashable, CustomStringConvertible {
    
    let col:Character
    let row:Int
    
    var hashValue: Int {
        return description.hashValue
    }
    
    var description: String {
        return "\(col)\(row)"
    }

    static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.col == rhs.col && lhs.row == rhs.row
    }
    
    init(col:Character, row:Int) {
        self.col = col
        self.row = row
    }
    
}

class Cell {
    var coordinate:Coordinate
    var value:Int
    
    init(col:Character,row:Int, val:Int) {
        self.coordinate = Coordinate(col: col, row: row)
        self.value = val
    }
}

class Spreadsheet {
    var grid = Dictionary<Coordinate,Cell>()
    
    init() {
        let letters:String = "AVCDEFGHIJKLMNOPQRSTUVWXYZ"
        var stringIndex = letters.startIndex
        let rows = 50
        
        repeat {
            let colletter = letters[stringIndex]
            stringIndex = letters.index(after: stringIndex)
            for index in 1...rows{
                let cell = Cell(col: colletter, row: index, val: index)
                grid[cell.coordinate] = cell
            }
        } while stringIndex != letters.endIndex
    }
    
    func setValue(coord:Coordinate , value:Int)  {
        grid[coord]?.value = value
    }
    
    var total:Int{
        return grid.values.reduce(0, { (total, cell) in  return total + cell.value })
    }
    
}
