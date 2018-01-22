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
    let parts:[Part]
    let compositeParts:[CompositePart]
    
    init(customer:String,parts:[Part],composites:[CompositePart]) {
        self.customer = customer
        self.parts = parts
        self.compositeParts = composites
    }
    
    var totalPrice:Float{
        let partReducer = { (subtotal:Float,part:Part) -> Float in return subtotal + part.price }
        
        let total = parts.reduce(0, partReducer)
        
        return compositeParts.reduce(total, { (subtotal, cparts) -> Float in
            return cparts.parts.reduce(subtotal, partReducer)
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
