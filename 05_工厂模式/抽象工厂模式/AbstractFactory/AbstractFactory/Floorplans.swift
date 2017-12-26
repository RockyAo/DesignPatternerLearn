//
//  Floorplans.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

enum EngineOption : String{
    case front = "Front"
    case mid = "Mid"
}

protocol Floorplan {
    var seats:Int{ get }
    var enginePosition:EngineOption { get }
    
}

class ShortFloorplan: Floorplan {
    var seats: Int = 2
    
    var enginePosition: EngineOption = .mid
}

class StandardFloorplan: Floorplan {
    var seats: Int = 4
    var enginePosition: EngineOption = .front
}

class LongFloorplan: Floorplan {
    var seats: Int = 8
    var enginePosition: EngineOption = .front
}
