//
//  main.swift
//  Command
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let cal = Calculator()

cal.add(10)
cal.multiply(4)
cal.subtract(2)

print("Total : \(cal.total)")

for _ in 0..<3 {
    cal.undo()
    print("Undo called . Total: \(cal.total)")
}
