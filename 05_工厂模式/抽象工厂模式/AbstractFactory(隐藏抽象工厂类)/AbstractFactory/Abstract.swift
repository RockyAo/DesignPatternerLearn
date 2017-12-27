//
//  Abstract.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class CarFactory {
    
    final class func getFactory(car:Cars) -> CarFactory {
        var factory:CarFactory
        switch car {
        case .compact:
            factory = CompactCarFactory()
        case .sports:
            factory = SportsCarFactory()
        case .suv:
            factory = SUVCarFactory()
        }
        return factory
    }
    
    func createFloorplan() -> Floorplan {
        fatalError("no implemention")
    }
    
    func createSuspension() -> Suspension {
        fatalError("no implemention")
    }
    
    func createDrivetrain() -> Drivetrain {
        fatalError("no implemention")
    }
}
