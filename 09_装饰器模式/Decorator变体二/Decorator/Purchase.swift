//
//  Purchase.swift
//  Decorator
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Purchase:CustomStringConvertible{
    
    private let product:String
    private let price:Float
    
    init(product:String,price:Float) {
        self.product = product
        self.price = price
    }
    
    var description: String {
        return product
    }
    
    var totalPrice:Float{
        return price
    }
    
}
