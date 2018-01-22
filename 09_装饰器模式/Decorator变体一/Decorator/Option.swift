//
//  Option.swift
//  Decorator
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//  模拟修改 purchase 类。

import Foundation

class BasePurchaseDecorator: Purchase {
    private let wrappedPurchase:Purchase
    
    init(purchase:Purchase) {
        wrappedPurchase = purchase
        super.init(product: purchase.description, price: purchase.totalPrice)
    }
}

class PurchaseWithGiftWrap: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + giftwrap" }
    override var totalPrice: Float { return super.totalPrice + 2 }
}

class PurchaseWithRibbon: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + ribbon" }
    override var totalPrice: Float { return super.totalPrice + 1 }
}

class PurchaseWithDelivery: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + delivery" }
    override var totalPrice: Float { return super.totalPrice + 5 }
}
