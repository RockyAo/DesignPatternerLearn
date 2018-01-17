//
//  Employees.swift
//  Adapter
//
//  Created by Rocky on 2018/1/16.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

struct Employee {
    
    var name:String
    var title:String
}


protocol EmployeeDataSource {
    var employees:[Employee]{ get }
    func searchByName(_ name:String) -> [Employee]
    func searchByTitle(_ title:String) -> [Employee]
}
