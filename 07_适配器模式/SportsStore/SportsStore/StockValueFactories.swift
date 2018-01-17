//
//  StockValueFactories.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/27.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class StockTotalFactory {
    
    enum Currency {
        case USD
        case GBP
        case other
    }
    
    fileprivate(set) var formatter:StockValueFormatter?
    fileprivate(set) var converter:StockValueConvertable?
    
    class func getFactory(curr:Currency) -> StockTotalFactory{
        switch curr {
        case .USD:
            return DollarStockTotalFactory.shared
        case .GBP:
            return PoundStockTotalFactory.shared
        default:
            return EuroHandlerAdapter.instance
        }
    }
}

private class DollarStockTotalFactory : StockTotalFactory {
    
    private override init() {
        super.init()
        self.formatter = DollarStockValueFormatter()
        self.converter = DollarStockValueConverter()
    }
    
    static let shared:DollarStockTotalFactory = DollarStockTotalFactory()
}

private class PoundStockTotalFactory : StockTotalFactory{
    
    private override init() {
        super.init()
        
        self.formatter = PoundStockValueFormatter()
        self.converter = PoundStockValueConverter()
    }
    
    static let shared:PoundStockTotalFactory = PoundStockTotalFactory()
}

private class EuroHandlerAdapter: StockTotalFactory ,
                                  StockValueConvertable,
                                  StockValueFormatter{
    
    static let instance:EuroHandlerAdapter = EuroHandlerAdapter()
    
    private let handler:EuroHandler
    
    override init() {
        handler = EuroHandler()
        super.init()
        super.formatter = self
        super.converter = self
    }
    
    
    func convertTotal(_ total: Double) -> Double {
        return handler.getCurrencyAmount(total)
    }
    
    func formatTotal(_ total: Double) -> String {
        return handler.getDisplayString(amount: total)
    }
    
    
}

