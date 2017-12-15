//
//  main.swift
//  ObjectTemplate
//
//  Created by Rocky on 2017/12/15.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

var products = [
    Product(name: "kayak", description: "A boat for one person", price: 275.0, stock: 10),
    Product(name: "LifeJacket", description: "Protective and fashionable", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", description: "FIFA-aoorived suze abd weight", price: 19.5, stock: 32)
]


func caculateTax(product:Product) -> Double {
    return product.price * 0.2
}

func caculateStockValue(tuples:[Product]) -> Double{
    return tuples.reduce(0, { (total, product) -> Double in
        return total + (product.price * Double(product.stock))
    })
}

print("Sales tax for kayak:$\(caculateTax(product: products[0]))")

print("Total value of stock:$\(caculateStockValue(tuples: products))")
