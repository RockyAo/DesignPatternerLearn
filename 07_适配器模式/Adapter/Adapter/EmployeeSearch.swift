//
//  SearchTool.swift
//  Adapter
//
//  Created by Rocky on 2018/1/16.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class SearchTool {
    
    enum SearchType {
        case name
        case title
    }
    
    private let sourcs:[EmployeeDataSource]
    
    init(dataSources:EmployeeDataSource...) {
        self.sourcs = dataSources
    }
    
    var employees:[Employee] {
        
        var results = [Employee]()
        
        sourcs.forEach { (e) in
            results += e.employees
        }
        return results
    }
    
    func search(text:String,type:SearchType) -> [Employee] {
        
        var result = [Employee]()
        sourcs.forEach { (e) in
            result += type == SearchType.name ? e.searchByName(text) : e.searchByTitle(text)
        }
        return result
    }
}
