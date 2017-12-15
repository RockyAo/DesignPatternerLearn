//
//  main.swift
//  ObjectTemplate
//
//  Created by Rocky on 2017/12/15.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

var products = [
    Product(name: "kayak", price: 275.0, stock: 10),
    Product(name: "LifeJacket", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", price: 19.5, stock: 32)
]


func caculateStockValue(tuples:[Product]) -> Double{
    return tuples.reduce(0, { (total, product) -> Double in
        return total + (product.price * Double(product.stockValue))
    })
}

print("Sales tax for kayak:$\(products[0].calculateTax(rate: 0.2))")

print("Total value of stock:$\(caculateStockValue(tuples: products))")

products[0].stock = -50

print("Stock level for kayak :\(products[0].stock)")
