//
//  CustomerOrder.swift
//  Composite
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class CustomerOrder {
    
    let customer:String
    let parts:[CarPart]
    
    init(customer:String,parts:[CarPart]) {
        self.customer = customer
        self.parts = parts
    }
    
    var totalPrice:Float{
    
        return parts.reduce(0, { (subtotal, cparts) -> Float in
            return subtotal + cparts.price
        })
    }
    
    func printDetail()  {
        print("order for \(customer): \n Cost:\(formateCurrencyString(number: totalPrice))")
    }
    
    func formateCurrencyString(number:Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
