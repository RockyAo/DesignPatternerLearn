//
//  main.swift
//  AbstractFactory
//
//  Created by Rocky on 2017/12/26.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation



var car = Car(carType: .sports)

car.printDetail()

DispatchQueue.global().async {
    DispatchQueue.main.sync {
        print("啦啦啦阿拉啊")
    }
}
