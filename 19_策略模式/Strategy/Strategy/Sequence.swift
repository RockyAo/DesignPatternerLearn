//
//  Sequence.swift
//  Strategy
//
//  Created by Rocky on 2018/1/28.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Sequence {
    private var numbers:[Int]
    
    init(_ numbers:Int...) {
        self.numbers = numbers
    }
    
    func addNumber(_ value:Int) {
        self.numbers.append(value)
    }
    
    func compute(strategy:Strategy) -> Int {
        return strategy.execute(values: self.numbers)
    }
}
