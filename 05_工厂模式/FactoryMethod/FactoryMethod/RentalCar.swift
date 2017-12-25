//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by Rocky on 2017/12/25.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

///用基类实现更合适。协议感觉有点怪。特别是下面这个全局函数

func createRentalCar(by passengers:Int) -> RentalCar? {
    var car:RentalCar?
    
    switch passengers {
    case 0...1:
        car = Sports()
    case 2...3:
        car = Compact()
    case 4...8:
        car = SUV()
    case 9...14:
        car = Minivan()
    default:
        car = nil
    }
    return car
}

protocol RentalCar {
    var name:String { get }
    var passengers:Int { get }
    var pricePerDay:Float { get }
}


class Compact: RentalCar {
    var name: String = "VM Golf"
    
    var passengers: Int = 3
    
    var pricePerDay: Float = 20
    
}

class Sports: RentalCar {
    var name: String = "Porsche Boxter"
    
    var passengers: Int = 1
    
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name: String = "Cadillac Escalade"
    
    var passengers: Int = 8
    
    var pricePerDay: Float = 75
}

class Minivan: RentalCar {
    var name: String = "Chevrolet Express"
    
    var passengers: Int = 14
    
    var pricePerDay: Float = 40
    
}

