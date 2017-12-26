//
//  main.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

let factory = CarFactory.getFactory(car: .sports)

var car = Car(carType: .sports,
              floor: factory.createFloorplan(),
              suspension: factory.createSuspension(),
              drive: factory.createDrivetrain())

car.printDetail()
