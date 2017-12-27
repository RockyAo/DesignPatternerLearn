//
//  Suspension.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

enum SuspensionOption : String{
    case standard = "Standard"
    case sports = "Firm"
    case soft = "Soft"
}

protocol Suspension {
    var suspensionType:SuspensionOption { get }
}

class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .standard
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .soft
}

class RaceSuspension: Suspension {
    var suspensionType: SuspensionOption = .sports
}
