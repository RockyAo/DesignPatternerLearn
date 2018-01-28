//
//  main.swift
//  Memento
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let ledger = Ledger()

ledger.addEntry(counterParty: "Bob", amount: 100.43)
ledger.addEntry(counterParty: "Joe", amount: 200.20)

let undoCommand = ledger.addEntry(counterParty: "Alice", amount: 500)
ledger.addEntry(counterParty: "Tony", amount: 20)


ledger.printEntries()

undoCommand.excute()

ledger.printEntries()
