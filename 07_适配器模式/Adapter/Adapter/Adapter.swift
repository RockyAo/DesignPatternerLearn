//
//  Adapter.swift
//  Adapter
//
//  Created by Rocky on 2018/1/17.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

extension NewCoDirectory : EmployeeDataSource{

    var employees: [Employee] {
        return getStaff().map({ (key,value) -> Employee in
            return Employee(name: value.getName(), title: value.getJob())
        })
    }
    
    func searchByName(_ name: String) -> [Employee] {
        return createEmployees(filter: { (m) -> Bool in
            return m.getName().range(of: name) != nil
        })
    }
    
    func searchByTitle(_ title: String) -> [Employee] {
        return createEmployees(filter: { (m) -> Bool in
            return m.getJob().range(of: title) != nil
        })
    }
    
    func createEmployees(filter filterClosure:((NewCoStaffMember) -> Bool)) -> [Employee] {
        return getStaff().map({ (key,value) -> Employee in
            return Employee(name: value.getName(), title: value.getJob())
        })
    }
    
}
