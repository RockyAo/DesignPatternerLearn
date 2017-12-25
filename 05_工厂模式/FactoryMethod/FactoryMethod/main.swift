//
//  main.swift
//  FactoryMethod
//
//  Created by Rocky on 2017/12/25.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

print("Hello, World!")
let passengers = [1,3,5]

for p in passengers{
    print("\(p) passegers: \(CarSelector.selectCar(by: p) ?? "")")
}

