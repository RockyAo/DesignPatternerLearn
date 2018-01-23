//
//  main.swift
//  Facade
//
//  Created by Rocky on 2018/1/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let map = TreasureMap()
let ship = PirateShip()
let crew = PirateCrew()

let treasureLocation = map.findTreasure(by: .galleon)
let sequence:[Character] = ["A","B","C","D","E","F","G"]
let eastWestPos = sequence.filter { (c) -> Bool in
    if c == treasureLocation.gridLetter {
        return true
    }
    return false
}.count

let shipTarget = PirateShip.ShipLocation(northSouth: Int(treasureLocation.gridNumber), eastWest: eastWestPos)

ship.moveToLocation(shipTarget) { (location) in
    crew.performAction(.attack_ship, callBack: { (prize) in
        print("Prize: \(prize) pieces of eight")
    })
}

////使用等待控制台输入的方式保持应用运行
FileHandle.standardInput.availableData
