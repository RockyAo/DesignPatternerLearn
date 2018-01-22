//
//  ProductDecorators.swift
//  SportsStore
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
// 装饰器模式

import Foundation

class PriceDecorator: Product {
    fileprivate let wrappedProduct:Product
    
    init(product:Product) {
        self.wrappedProduct = product
        super.init(name: product.name,
                   description: product.description,
                   category: product.category,
                   price: product.price,
                   stockLevel: product.stockLevel)
    }
    
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        fatalError("init(name:description:category:price:stockLevel:) has not been implemented")
    }
}

class LowStockIncreaseDecorator : PriceDecorator{
    override var price: Double {
        var price = wrappedProduct.price
        if stockLevel <= 4 {
            price *= 0.5
        }
        return price
    }

}

class SoccerDecreaseDecorator: PriceDecorator {
    override var price: Double {
        return super.wrappedProduct.price * 0.5
    }
}
