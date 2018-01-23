//
//  TreasureMap.swift
//  Facade
//
//  Created by Rocky on 2018/1/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation


class TreasureMap {
    enum Treasures {
        case galleon
        case buriedGold
        case sunkenJewels
    }
    
    struct MapLocation {
        let gridLetter: Character
        let gridNumber: UInt
    }
    
    func findTreasure(by type:Treasures) -> MapLocation {
        switch type {
        case .galleon:
            return MapLocation(gridLetter: "D", gridNumber: 6)
        case .buriedGold:
            return MapLocation(gridLetter: "C", gridNumber: 2)
        case .sunkenJewels:
            return MapLocation(gridLetter: "F", gridNumber: 12)
        }
    }
}
