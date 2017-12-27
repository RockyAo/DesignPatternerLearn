//
//  Drivetrains.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

enum DriveOption : String{
    case front = "Front"
    case rear = "Rear"
    case all = "4WD"
}

protocol Drivetrain {
    var driveType:DriveOption { get }
}

class FrontWheelDrive: Drivetrain {
    var driveType: DriveOption = .front
}

class RearWheelDrive: Drivetrain {
    var driveType: DriveOption = .rear
    
}

class AllWheelDrive: Drivetrain {
    var driveType: DriveOption = .all
}
