//
//  main.swift
//  Strategy
//
//  Created by Rocky on 2018/1/28.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let sequence = Sequence(1,2,3,4)

sequence.addNumber(10)
sequence.addNumber(20)

let sumStategy = SumStategy()

let multiplyStrategy = MultiplyStategy()

let sum = sequence.compute(strategy: sumStategy)

print("Sum:\(sum)")

let multiply = sequence.compute(strategy: multiplyStrategy)

print("multiply: \(multiply)")
