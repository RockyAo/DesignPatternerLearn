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

class Airplane: Equatable {
    
    var name:String
    var currentPosition:Position
    private var otherPlanes:[Airplane] = []
    
    init(name:String,initialPos:Position) {
        self.name = name
        self.currentPosition = initialPos
        
    }
    
    static func ==(lhs: Airplane, rhs: Airplane) -> Bool {
        return lhs.name == rhs.name
    }
    
    func addPlanesInArea(planes:Airplane...)  {
        otherPlanes.append(contentsOf: planes)
    }
    
    func otherPlaneDidLand(plane:Airplane)  {
        if let index = otherPlanes.index(of: plane) {
            otherPlanes.remove(at: index)
        }
    }
    
    func otherPlaneDidChangePosition(plane:Airplane) -> Bool {
        return plane.currentPosition.distanceFromRunway ==
            self.currentPosition.distanceFromRunway && abs(plane.currentPosition.height - self.currentPosition.height) < 1000
    }
    
    func changePosition(newPosition:Position)  {
        self.currentPosition = newPosition
        otherPlanes.forEach { (a) in
            if a.otherPlaneDidChangePosition(plane: self) {
                print("\(name) : too close ! Abort !")
                return
            }
        }
        print("\(name): Position changed")
    }
    
    func land() {
        self.currentPosition = Position(distanceFromRunway: 0, height: 0)
        otherPlanes.forEach { (a) in
            a.otherPlaneDidLand(plane: self)
        }
        print("\(name): landed")
    }
}
