//
//  Messages.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Message {
    init(message:String)
    func prepareMessage()
    var contentToSend:String { get }
}

class ClearMessage: Message {
    
    private let message:String
    
    required init(message: String) {
        self.message = message
    }
    
    func prepareMessage() {
    
    }
    
    var contentToSend: String {
        return message
    }
    
}

class EncryptedMessage: Message {
    
    private var clearText:String
    private var cipherText:String = ""
    
    required init(message: String) {
        self.clearText = message
    }
    
    func prepareMessage() {
        cipherText = String(clearText.reversed())
    }
    
    var contentToSend: String{
        return cipherText
    }
}
