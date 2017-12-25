//
//  ProductDataStore.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/22.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class ProductDataStore{
    
    var callBack:((Product) -> Void)?
    
    private let networkQueue:DispatchQueue = DispatchQueue.global(qos: .background)
    
    lazy var products:[Product] = self.loadData()
    
    private var productData:[Product] = [
        Product(name:"Kayak", description:"A boat for one person",
                category:"Watersports", price:275.0, stockLevel:0),
        Product(name:"Lifejacket", description:"Protective and fashionable",
                category:"Watersports", price:48.95, stockLevel:0),
        Product(name:"Soccer Ball", description:"FIFA-approved size and weight",
                category:"Soccer", price:19.5, stockLevel:0),
        Product(name:"Corner Flags",
                description:"Give your playing field a professional touch",
                category:"Soccer", price:34.95, stockLevel:0),
        Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",
                category:"Soccer", price:79500.0, stockLevel:0),
        Product(name:"Thinking Cap", description:"Improve your brain efficiency",
                category:"Chess", price:16.0, stockLevel:0),
        Product(name:"Unsteady Chair",
                description:"Secretly give your opponent a disadvantage",
                category: "Chess", price: 29.95, stockLevel:0),
        Product(name:"Human Chess Board", description:"A fun game for the family",
                category:"Chess", price:75.0, stockLevel:0),
        Product(name:"Bling-Bling King",
                description:"Gold-plated, diamond-studded King",
                category:"Chess", price:1200.0, stockLevel:0)
    ]
    
    init() {}
    
    private func loadData() -> [Product]{
        for p in productData{
            networkQueue.async {
                let stockConn = NetworkPool.shared.doGetConnection()
                if let level = stockConn.getStockLevel(name: p.name),
                    let callBack = self.callBack {
                    p.stockLevel = level
                    DispatchQueue.main.async {
                        callBack(p)
                    }
                }
                
                NetworkPool.shared.returnConnection(stockConn)
            }
        }
        
        return productData
    }
}
