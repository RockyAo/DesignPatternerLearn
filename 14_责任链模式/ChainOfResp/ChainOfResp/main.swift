//
//  main.swift
//  ChainOfResp
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let messages = [
    Message(from: "bob@example.com", to: "joe@example", subject: "Free for lunch"),
    Message(from: "joe@example.com", to: "alice@example", subject: "New Contact"),
    Message(from: "pete@example.com", to: "all@example", subject: "Priority: All-hands Meeting")
]

let localT = LocalTransmitter()
let remoteT = RemoteTAransmitter()

messages.forEach { (msg) in
    if let index = msg.from.index(of: "@") {
        
        if msg.to.hasSuffix(String(msg.from[Range(uncheckedBounds: (lower: index, upper: msg.from.endIndex))])){
            localT.sendMessage(msg)
        }else{
            remoteT.sendMessage(msg)
        }
    }else{
        
        print("Error: cannot send message to \(msg.from)")
    }
}
