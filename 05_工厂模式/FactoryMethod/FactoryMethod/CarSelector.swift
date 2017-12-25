//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by Rocky on 2017/12/25.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class CarSelector{
    
    class func selectCar(by passengers:Int) -> String?{
        let car = createRentalCar(by: passengers)
        return car?.name
    }
}
