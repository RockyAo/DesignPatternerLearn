//
//  Channels.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class LandLine: ClearMessageChannel {
    func send(message: String) {
        print("LandLine:" + message )
    }
}

class SecureLandLine: SecureMessageChannel {
    func sendEncryptedMessage(encryptedText: String) {
        print("SecureLandLine:" + encryptedText)
    }
}

class Wireless: ClearMessageChannel {
    func send(message: String) {
        print("Wireless:" + message)
    }
}

class SecureWireless: SecureMessageChannel {
    func sendEncryptedMessage(encryptedText: String) {
        print("Wireless" + encryptedText)
    }
}
