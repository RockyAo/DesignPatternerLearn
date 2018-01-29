//
//  Visitor.swift
//  Vistor
//
//  Created by Rocky on 2018/1/29.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Shape {
    func accept(visitor:Visitor)
}

protocol Visitor {
    func visit(_ shape:Circle)
    func visit(_ shape:Square)
    func visit(_ shape:Reactangle)
}

class AreaVisitor : Visitor {
    
    private(set) var totalArea:Float = 0
    
    func visit(_ shape: Circle) {
        totalArea += (Float.pi * powf(shape.radius, 2))
    }
    
    func visit(_ shape: Square) {
        totalArea += powf(shape.length, 2)
    }
    
    func visit(_ shape: Reactangle) {
        totalArea += (shape.xlen * shape.ylen)
    }

}

class EdgesVisitor : Visitor {
    
    private(set) var totalEdges = 0
    
    func visit(_ shape: Circle) {
        totalEdges += 1
    }
    
    func visit(_ shape: Square) {
        totalEdges += 4
    }
    
    func visit(_ shape: Reactangle) {
        totalEdges += 4
    }
}
