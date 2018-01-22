//
//  Discounts.swift
//  Decorator
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class DiscountDecorator: Purchase {
    private let wrappedPurchase:Purchase
    
    init(purchase:Purchase) {
        self.wrappedPurchase = purchase
        super.init(product: purchase.description, price: purchase.totalPrice)
    }
    
    override var description: String {
        return super.description
    }
    
    var discountAmount:Float {
        return 0
    }
    
    func countDiscounts() -> Int {
        var total = 1
        if let discounter = wrappedPurchase as? DiscountDecorator {
            total += discounter.countDiscounts()
        }
        return total
    }
    
}

class BlackFridayDecorator: DiscountDecorator {
    override var totalPrice: Float {
        return super.totalPrice - discountAmount
    }
    
    override var discountAmount: Float{
        return super.totalPrice * 0.2
    }
}

class EndOfLineDecorator: DiscountDecorator {
    override var totalPrice: Float {
        return super.totalPrice - discountAmount
    }
    
    override var discountAmount: Float{
        return super.totalPrice * 0.7
    }
}
