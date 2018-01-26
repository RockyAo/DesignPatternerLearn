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
    var grid:Flyweight
    
    init() {
       grid = FlyweightFactory.createFlyweight()
    }
    
    func setValue(coord:Coordinate , value:Int)  {
        grid[coord] = value
    }
    
    var total:Int{
        return grid.total
    }
    
}
