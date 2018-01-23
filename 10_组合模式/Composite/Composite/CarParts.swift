//
//  CarParts.swift
//  Composite
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol CarPart {
    var name:String{ get }
    var price:Float { get }
}

class Part : CarPart{
    let name:String
    let price:Float
    
    init(name:String,price:Float) {
        self.name = name
        self.price = price
    }
}

class CompositePart:CarPart {
    let name:String
    let parts:[CarPart]
    
    init(name:String,parts:CarPart...) {
        self.name = name
        self.parts = parts
    }
    
    var price: Float{
        return parts.reduce(0, { (subtotal, part) -> Float in
            return subtotal + part.price
        })
    }
    
}
