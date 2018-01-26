//
//  Transmitters.swift
//  ChainOfResp
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Transmitter {
    var nextLink:Transmitter?
    
    required init() {}
    
    class func createChain() -> Transmitter?{
        let transmitterClasses:[Transmitter.Type] = [
            PriorityTransmitter.self,
            LocalTransmitter.self,
            RemoteTAransmitter.self
        ]
        
        var link:Transmitter?
        
        transmitterClasses.reversed().forEach { (t) in
            let existingLink = link
            link = t.init()
            link?.nextLink = existingLink
        }
        
        return link
    }
    
    func sendMessage(_ message:Message)  {
        
        if let next = nextLink {
            next.sendMessage(message)
        }else{
            print("End of chain reached, message do not send")
        }
    }
    
    
    fileprivate class func matchEmailSuffix(from message:Message) -> Bool{
        
        if let index = message.from.index(of: "@") {
            
            return message.to.hasSuffix(String(message.from[Range(uncheckedBounds: (lower: index, upper: message.from.endIndex))]))
        }
        
        return false
    }
}

final class LocalTransmitter : Transmitter {
    override func sendMessage(_ message: Message) {
        if Transmitter.matchEmailSuffix(from: message) {
            print("Message to \(message.to) sent locally")
        }else{
            super.sendMessage(message)
        }
    }
}

final class RemoteTAransmitter : Transmitter {
    override func sendMessage(_ message: Message) {
        if !Transmitter.matchEmailSuffix(from: message) {
            print("Message to \(message.to) sent Remote")
        }else{
            super.sendMessage(message)
        }
    }
}

final class PriorityTransmitter : Transmitter {
    override func sendMessage(_ message: Message) {
        if message.subject.hasSuffix("Priority") {
            print("Message to \(message.to) sent Priority")
        }else{
            super.sendMessage(message)
        }
    }
}



