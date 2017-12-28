//
//  main.swift
//  Builder
//
//  Created by Rocky on 2017/12/27.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//let order = Burger(name: "Joe", veggie: false, patties: 2, pickles: true, mayo: true, ketchup: true, lettuce: true, cook: .normal)
//
//order.printDescription()


let builder = BurgerBuilder()

let burger:Burger = builder
    .setVeggie(true)
    .setMayo(false)
    .setCooked(.wellDone)
    .addPatty(false)
    .buildBurgerObject(name: "Joe")


burger.printDescription()



//// cocoa 中 建造者模式的应用
var dateBuilder = DateComponents()
dateBuilder.hour = 10
dateBuilder.day = 6
dateBuilder.month = 9
dateBuilder.year = 1950
dateBuilder.calendar = Calendar(identifier: .gregorian)


if let date = dateBuilder.date {
    print(date)
}
