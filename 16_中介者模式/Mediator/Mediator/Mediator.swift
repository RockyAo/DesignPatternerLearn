//
//  Mediator.swift
//  Mediator
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Peer {
    var name:String { get }
    func otherPlaneDidChangePosition(_ position:Position) -> Bool
}

protocol Mediator {
    func registerPeer(_ peer:Peer)
    func unregisterPeer(_ peer:Peer)
    func changePosition(for peer:Peer,position:Position) -> Bool
}

class AirplaneMediator : Mediator {
    
    private var peers:[String:Peer]
    
    private let writeQueue:DispatchQueue = DispatchQueue(label: "writeQ", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
    
    init() {
        peers = [String:Peer]()
    }
    
    func registerPeer(_ peer: Peer) {
        writeQueue.sync(flags: DispatchWorkItemFlags.barrier) {
            self.peers[peer.name] = peer
        }
    }
    
    func unregisterPeer(_ peer: Peer) {
        _ = writeQueue.sync(flags: DispatchWorkItemFlags.barrier) {
            self.peers.removeValue(forKey: peer.name)
        }
    }
    
    func changePosition(for peer: Peer, position: Position) -> Bool {
        var result = false
        
        writeQueue.sync {
            for storedPeer in peers.values{
                if peer.name != storedPeer.name && storedPeer.otherPlaneDidChangePosition(position){
                    result = true
                }
            }
        }
        
        return result
    }
    
}
