//
//  CarParts.swift
//  Composite
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Part {
    let name:String
    let price:Float
    
    init(name:String,price:Float) {
        self.name = name
        self.price = price
    }
}

class CompositePart {
    let name:String
    let parts:[Part]
    
    init(name:String,parts:Part...) {
        self.name = name
        self.parts = parts
    }
}
