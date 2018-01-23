//
//  PirateCrew.swift
//  Facade
//
//  Created by Rocky on 2018/1/23.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class PirateCrew {
    let workQueue:DispatchQueue = DispatchQueue(label: "crewWorkQ")
    
    enum Actions {
        case attack_ship
        case dig_for_gold
        case dive_for_jewels
    }
    
    func performAction(_ action:Actions,callBack:@escaping (Int)-> Void) {
        workQueue.async {
            var prizeValue = 0
            
            switch action{
            case .attack_ship:
                prizeValue = 10000
            case .dig_for_gold:
                prizeValue = 5000
            case .dive_for_jewels:
                prizeValue = 1000
            }
            
            callBack(prizeValue)
        }
    }
}
