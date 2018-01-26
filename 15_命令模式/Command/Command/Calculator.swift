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
    private var history:[Command] = []
    private var queue:DispatchQueue = DispatchQueue(label: "arrayQ")
    private var performingUndo = false
    
    
    func add(_ amount:Int) -> Void {
        addUndoCommand(method: Calculator.subtract(_:), amount: amount)
        total += amount
    }
    
    func subtract(_ amount:Int) -> Void {
        addUndoCommand(method: Calculator.add(_:), amount: amount)
        total -= amount
    }
    
    func multiply(_ amount:Int) -> Void {
        addUndoCommand(method: Calculator.divide(_:), amount: amount)
        total *= amount
    }
    
    func divide(_ amount:Int) -> Void {
        addUndoCommand(method: Calculator.multiply(_:), amount: amount)
        total /= amount
    }
    
    private func addUndoCommand(method:@escaping (Calculator)->(Int)->Void,amount:Int){
        if !performingUndo {
            queue.sync {
                history.append(GenericCommand<Calculator>.createCommand(receiver: self, instuctions: { (cal) in
                    method(cal)(amount)
                }))
            }
        }
    }
    
    func undo()  {
        queue.sync {
            if history.count > 0 {
                self.performingUndo = true
                history.removeLast().excute()
                self.performingUndo = false
            }
        }
    }
}
