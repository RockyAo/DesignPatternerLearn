//
//  Ledger.swift
//  Memento
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class LedgerEntry {
    let id:Int
    let counterParty:String
    let amount:Float
    
    init(id:Int,counterParty:String,amount:Float) {
        self.id = id
        self.counterParty = counterParty
        self.amount = amount
    }
}

class LedgerCommand {
    private let instructions:(Ledger)->Void
    private let receiver:Ledger
    
    init(instructions:@escaping (Ledger)->Void,receiver:Ledger) {
        self.instructions = instructions
        self.receiver = receiver
    }
    
    func excute() {
        self.instructions(self.receiver)
    }
}

class Ledger {
    
    private var entries = [Int:LedgerEntry]()
    private var nexId = 1
    var total:Float = 0
    
    @discardableResult
    func addEntry(counterParty:String,amount:Float) -> LedgerCommand {
        nexId += 1
        let entry = LedgerEntry(id: nexId, counterParty: counterParty, amount: amount)
        entries[entry.id] = entry
        total += amount
        return createUndoCommand(entry: entry)
    }
    
    func createUndoCommand(entry:LedgerEntry) -> LedgerCommand {
        return LedgerCommand(instructions: { (target) in
            
            if let removed = target.entries.removeValue(forKey: entry.id) {
                target.total -= removed.amount
            }
            
        }, receiver: self)
    }
    
    func printEntries()  {
        for id in entries.keys.sorted(by: <){
            if let entry = entries[id] {
                print("#\(id) : \(entry.counterParty) $\(entry.amount)")
            }
        }

        print("total: \(total)")
        print("----------------")
    }
}

