//
//  StockValueImplementation.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/27.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

protocol StockValueFormatter {
    func formatTotal(_ total:Double) -> String
}

class DollarStockValueFormatter: StockValueFormatter {
    func formatTotal(_ total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: total)
        return formatted
    }
    
}

class PoundStockValueFormatter: StockValueFormatter {
    func formatTotal(_ total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: total)
        return "£" + formatted
    }
}

protocol StockValueConvertable {
    func convertTotal(_ total:Double) -> Double
}

class DollarStockValueConverter: StockValueConvertable {
    func convertTotal(_ total: Double) -> Double {
        return total
    }

}

class PoundStockValueConverter: StockValueConvertable {
    func convertTotal(_ total: Double) -> Double {
        return 0.60338 * total
    }
}
