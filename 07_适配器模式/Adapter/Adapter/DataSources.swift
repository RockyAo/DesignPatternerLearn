//
//  DataSources.swift
//  Adapter
//
//  Created by Rocky on 2018/1/16.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation


class DataSourceBase: EmployeeDataSource {
    
    var employees: [Employee] = []
    
    func searchByName(_ name: String) -> [Employee] {
        return search(selector: { (e) -> Bool in
            return e.name.range(of: name) != nil
        })
    }
    
    func searchByTitle(_ title: String) -> [Employee] {
        return search(selector: { (e) -> Bool in
            return e.title.range(of: title) != nil
        })
    }
    
    private func search(selector:((Employee) -> Bool)) -> [Employee]{
        
        var results = [Employee]()
        
        for e in employees {
            if selector(e) {
                results.append(e)
            }
        }
        
        return results
    }
}

class SalesDataSources: DataSourceBase {
    override init() {
        super.init()
        
        employees.append(Employee(name: "Alice", title: "VP of Sales"))
        employees.append(Employee(name: "Bob", title: "Account Exec"))
    }
}

class DevelopmentDataSource: DataSourceBase {
    
    override init() {
        super.init()
        employees.append(Employee(name: "Joe", title: "VP of Development"))
        employees.append(Employee(name: "Pepe", title: "Developer"))
    }
}
