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

class LedgerMemento: Memento {
    private var entries = [LedgerEntry]()
    private let total:Float
    private let nextId:Int
    
    init(ledger:Ledger) {
        self.entries = ledger.entries.values.map{ return $0 }
        self.total = ledger.total
        self.nextId = ledger.nexId
    }
    
    func apply(ledger:Ledger)  {
        ledger.total = self.total
        ledger.nexId = self.nextId
        ledger.entries.removeAll(keepingCapacity: true)
        
        entries.forEach { (entry) in
            ledger.entries[entry.id] = entry
        }
    }
}


class Ledger : Originator{
    
    
    fileprivate var entries = [Int:LedgerEntry]()
    fileprivate var nexId = 1
    
    var total:Float = 0
    
    func addEntry(counterParty:String,amount:Float)  {
        nexId += 1
        let entry = LedgerEntry(id: nexId, counterParty: counterParty, amount: amount)
        entries[entry.id] = entry
        total += amount
        
    }
    
    func createMemento() -> Memento {
        return LedgerMemento(ledger: self)
    }
    
    func applyMemento(_ memento: Memento) {
        if let m = memento as? LedgerMemento{
            m.apply(ledger: self)
        }
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

