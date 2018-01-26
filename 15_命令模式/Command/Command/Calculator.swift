//
//  Calculator.swift
//  Command
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Calculator {
    private(set) var total = 0
    
    func add(_ amount:Int) -> Void {
        total += amount
    }
    
    func subtract(_ amount:Int) -> Void {
        total -= amount
    }
    
    func multiply(_ amount:Int) -> Void {
        total *= amount
    }
    
    func divide(_ amount:Int) -> Void {
        total /= amount
    }
}
