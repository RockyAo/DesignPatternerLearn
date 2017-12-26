//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by Rocky on 2017/12/25.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class PriceCalculator {
    class func calculatePrice(by passengers:Int,and totalDays:Int) -> Float?{
        if let car = createRentalCar(by: passengers) {
            return car.pricePerDay * Float(totalDays)
        }
        
        return nil
    }
}
