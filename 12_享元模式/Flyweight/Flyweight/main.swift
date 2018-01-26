//
//  main.swift
//  Flyweight
//
//  Created by Rocky on 2018/1/24.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let ss1 = Spreadsheet()


ss1.setValue(coord: Coordinate(col: "A", row: 1), value: 100)
ss1.setValue(coord: Coordinate(col: "J", row: 20), value: 200)

print("SS1 Total : \(ss1.total)")



let ss2 = Spreadsheet()
ss1.setValue(coord: Coordinate(col: "F", row: 10), value: 200)
ss1.setValue(coord: Coordinate(col: "G", row: 23), value: 250)

print("SS2 Total : \(ss2.total)")

print("Cells create : \(1300 + ss1.grid.count + ss2.grid.count )")
