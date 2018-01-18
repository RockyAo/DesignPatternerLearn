//
//  Comms.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol ClearMessageChannel {
    func send(message:String)
}

protocol SecureMessageChannel {
    func sendEncryptedMessage(encryptedText:String)
}

class Communicator {
    private let clearChannel:ClearMessageChannel
    private let secureChannel:SecureMessageChannel
    
    init(clearChannel:ClearMessageChannel,secureChannel:SecureMessageChannel) {
        self.clearChannel = clearChannel
        self.secureChannel = secureChannel
    }
    
    func sendCleartextMessage(_ message:String)  {
        clearChannel.send(message: message)
    }
    
    func sendSecureMessage(_ message:String)  {
        secureChannel.sendEncryptedMessage(encryptedText: message)
    }
}
