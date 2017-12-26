//
//  CarParts.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

enum Cars : String {
    case compact = "VM Golf"
    case sports = "Porsche Boxter"
    case suv = "Cadillac Escalade"
}

struct Car {
    var carType:Cars
    var floor:Floorplan
    var suspension:Suspension
    var drive:Drivetrain
    
    func printDetail() {
        print("Car type: \(carType.rawValue)")
        print("Seats : \(floor.seats)")
        print("Engine : \(floor.enginePosition.rawValue)")
        print("Suspension : \(suspension.suspensionType.rawValue)")
        print("Drive : \(drive.driveType.rawValue)")
    }
}
