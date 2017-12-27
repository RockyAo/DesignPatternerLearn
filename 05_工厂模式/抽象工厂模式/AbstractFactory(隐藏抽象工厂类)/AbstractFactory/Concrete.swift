//
//  Concrete.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class CompactCarFactory : CarFactory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    override func createSuspension() -> Suspension {
        return RoadSuspension()
    }
    override func createDrivetrain() -> Drivetrain {
        return FrontWheelDrive()
    }
}

class SportsCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    override func createSuspension() -> Suspension {
        return RaceSuspension()
    }
    override func createDrivetrain() -> Drivetrain {
        return RearWheelDrive()
    }
}

class SUVCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    override func createSuspension() -> Suspension {
        return OffRoadSuspension()
    }
    override func createDrivetrain() -> Drivetrain {
        return AllWheelDrive()
    }
}
