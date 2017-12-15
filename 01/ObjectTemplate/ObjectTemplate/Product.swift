//
//  Product.swift
//  ObjectTemplate
//
//  Created by Rocky on 2017/12/15.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Product {
    var name:String
    var description:String
    var price:Double
    var stock:Int
    
    init(name:String,description:String,price:Double,stock:Int) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
    }
}
