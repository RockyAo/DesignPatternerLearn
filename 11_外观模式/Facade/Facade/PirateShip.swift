//
//  PirateShip.swift
//  Facade
//
//  Created by Rocky on 2018/1/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class PirateShip {
    struct ShipLocation {
        let northSouth:Int
        let eastWest:Int
    }
    
    var currentPosition:ShipLocation
    
    let movementQueue:DispatchQueue = DispatchQueue(label: "shipQ")
    
    init() {
        currentPosition = ShipLocation(northSouth: 5, eastWest: 5)
    }
    
    func moveToLocation(_ location:ShipLocation,callBack:@escaping (ShipLocation)->Void)  {
        
        movementQueue.async { [unowned self] in
            self.currentPosition = location
            callBack(self.currentPosition)
        }
    }
}
