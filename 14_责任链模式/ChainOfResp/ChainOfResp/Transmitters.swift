//
//  Transmitters.swift
//  ChainOfResp
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class LocalTransmitter {
    func sendMessage(_ message:Message) {
        print("Message to \(message.to) sent locally")
    }
}

class RemoteTAransmitter {
    func sendMessage(_ message:Message) {
        print("Message to \(message.to) sent remotely")
    }
}

