//
//  Strategies.swift
//  Strategy
//
//  Created by Rocky on 2018/1/28.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Strategy {
    func execute(values:[Int]) -> Int
}

class SumStategy: Strategy {
    func execute(values: [Int]) -> Int {
        return values.reduce(0, { $0 + $1 })
    }
}

class MultiplyStategy: Strategy {
    func execute(values: [Int]) -> Int {
        return values.reduce(1, { $0 * $1 })
    }
}
