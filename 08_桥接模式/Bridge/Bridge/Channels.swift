//
//  Channels.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Channel {
    func sendMessage(_ message:Message)
}

class LandLineChannel: Channel {
    func sendMessage(_ message: Message) {
        print("LandLine:" + message.contentToSend )
    }
    
}


class WirelessChannel: Channel {
    func sendMessage(_ message: Message) {
        print("Wireless:" + message.contentToSend)
    }

}


