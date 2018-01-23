//
//  Facade.swift
//  Facade
//
//  Created by Rocky on 2018/1/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

enum TreasureTypes {
    case ship
    case buried
    case sunken
}


class PirateFacade {
    private let map = TreasureMap()
    private let ship = PirateShip()
    private let crew = PirateCrew()
    
    func getTreasure(by type:TreasureTypes) -> Int? {
        var prizeAmount:Int?
        
        var treasureMapType:TreasureMap.Treasures
        var crewWorkType:PirateCrew.Actions
        
        switch type {
        case .ship:
            treasureMapType = .galleon
            crewWorkType = .dig_for_gold
        case .buried:
            treasureMapType = .buriedGold
            crewWorkType = .dig_for_gold
        case .sunken:
            treasureMapType = .sunkenJewels
            crewWorkType = .dive_for_jewels
        }
        
        let treasureLocation = map.findTreasure(by: treasureMapType)
        let sequence:[Character] = ["A","B","C","D","E","F","G"]
        let eastWestPos = sequence.filter { (c) -> Bool in
                if c == treasureLocation.gridLetter {
                    return true
                }
                return false
            }.count
        
       let shipTarget = PirateShip.ShipLocation(northSouth: Int(treasureLocation.gridNumber), eastWest: eastWestPos)
        
        let semaphore = DispatchSemaphore(value: 0)
        
        ship.moveToLocation(shipTarget) { (location) in
            self.crew.performAction(crewWorkType, callBack: { (prize) in
                prizeAmount = prize
                semaphore.signal()
            })
        }
        
        semaphore.wait()
        
        return prizeAmount
    }
}
