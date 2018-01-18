//
//  NewFeatures.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class SatelliteChannel: Channel {
    func sendMessage(_ message: Message) {
        print("Satellite" + message.contentToSend )
    }
}

class PriorityMessage: ClearMessage {
    override var contentToSend: String{
        return "Important" + super.contentToSend
    }
}
