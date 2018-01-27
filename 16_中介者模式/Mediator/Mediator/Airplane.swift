//
//  Airplane.swift
//  Mediator
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

struct Position {
    var distanceFromRunway:Int
    var height:Int
}

class Airplane: Peer {
   
    
    
    var name:String
    var currentPosition:Position
    var mediator:Mediator
    
    
    init(name:String,initialPos:Position,mediator:Mediator) {
        self.name = name
        self.currentPosition = initialPos
        self.mediator = mediator
        mediator.registerPeer(self)
    }
    
    
    func otherPlaneDidChangePosition(_ position: Position) -> Bool {
        return position.distanceFromRunway == self.currentPosition.distanceFromRunway &&
            abs(position.height - currentPosition.height) < 1000
    }
    
    func changePosition(newPosition:Position)  {
        self.currentPosition = newPosition
        
        if mediator.changePosition(for: self, position: self.currentPosition) {
            
            print("\(name) : Too close ! Abort !")
            
            return
        }
        
        print("\(name): Position changed")
    }
    
    func land() {
        self.currentPosition = Position(distanceFromRunway: 0, height: 0)
        mediator.unregisterPeer(self)
        
        print("\(name) landed")
    }
}
