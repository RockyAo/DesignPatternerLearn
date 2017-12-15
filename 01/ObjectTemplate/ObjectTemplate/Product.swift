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
    var price:Double
    
    private var stockBackingValue:Int = 0
    
    var stock:Int{
        get{
            return stockBackingValue
        }
        set{
            stockBackingValue = max(0, newValue)
        }
    }
    
    var stockValue:Double{
        get{
            return price * Double(stock)
        }
    }

    init(name:String,price:Double,stock:Int) {
        self.name = name
        self.price = price
        self.stock = stock
    }
    
    func calculateTax(rate:Double) -> Double {
        return price * rate
    }
    
    
}
