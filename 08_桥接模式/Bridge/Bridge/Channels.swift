//
//  Channels.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation


class Channel {
    
    enum Channels {
        case landline
        case wireless
        case satellite
    }
    
    class func getChannel(with channelType:Channels) -> Channel{
        switch channelType {
        case .landline:
            return LandLineChannel()
        case .wireless:
            return WirelessChannel()
        case .satellite:
            return SatelliteChannel()
        }
    }
    
    func sendMessage(_ message: Message) {
        fatalError("not implement")
    }
}

class LandLineChannel: Channel {
    override func sendMessage(_ message: Message) {
        print("LandLine:" + message.contentToSend )
    }
    
}

class WirelessChannel: Channel {
    override func sendMessage(_ message: Message) {
        print("Wireless:" + message.contentToSend)
    }

}


