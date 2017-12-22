//
//  main.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

print("Hello, World!")

let queue = DispatchQueue(label: "work.queue", qos: DispatchQoS.default, attributes: .concurrent)
let group = DispatchGroup()

print("start")

for i in 0..<20{

    let workItem = DispatchWorkItem(block: {
        if let book = Library.shared.checkoutBook(reader: "reader#\(i)"){
            Thread.sleep(forTimeInterval: TimeInterval(arc4random() % 2))
            Library.shared.returnBook(book)
        }
    })
    
    queue.async(group: group, execute: workItem)
}

_ = group.wait(timeout: DispatchTime.distantFuture)

print("all blocks complete")

Library.shared.printReport()
