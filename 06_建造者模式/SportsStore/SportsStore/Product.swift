//
//  Product.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/18.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

enum UpsellOpportunities {
    case SwimmingLessons
    case MapOfLakes
    case SoccerVideos
}

class Product:NSCopying{
    
    
    class func createProduct(_ name:String,
                             description:String,
                             category:String,
                             price:Double,
                             stockLevel:Int) -> Product{
        
        var productType:Product.Type
        
        switch category {
        case "Watersports":
            productType = WatersportsProduct.self
        case "Soccer":
            productType = SoccerProduct.self
        default:
            productType = Product.self
        }
        
        return productType.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
    }
    
    private(set) var name:String
    private(set) var description:String
    private(set) var category:String
    private var stockLevelBackingValue:Int = 0
    private var priceBackingValue:Double = 0
    fileprivate var salesTaxRate:Double = 0.2
    
    required init(name:String,description:String,category:String,price:Double,stockLevel:Int) {
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.stockLevel = stockLevel
    }
    
    var stockLevel:Int {
        get { return stockLevelBackingValue }
        set { stockLevelBackingValue = max(0, newValue) }
    }
    
    
    private(set) var price:Double{
        get { return priceBackingValue }
        set { priceBackingValue = max(1, newValue) }
    }
    
    var stockValue:Double{
        get { return price * (1 + salesTaxRate) * Double(stockLevel) }
    }
    
    var upsells:[UpsellOpportunities]{
        get{
            return Array()
        }
    }
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product(name: self.name,
                       description: self.description,
                       category: self.category, price: self.price, stockLevel: self.stockLevel)
    }
}


class WatersportsProduct: Product {
    required init(name:String,description:String,category:String,price:Double,stockLevel:Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        self.salesTaxRate = 0.1
    }
    
    override var upsells: [UpsellOpportunities]{
        return [UpsellOpportunities.SwimmingLessons,UpsellOpportunities.MapOfLakes]
    }
}

class SoccerProduct: Product {
    required init(name:String,description:String,category:String,price:Double,stockLevel:Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        self.salesTaxRate = 0.25
    }
    
    override var upsells: [UpsellOpportunities]{
        return [UpsellOpportunities.SoccerVideos]
    }
}
