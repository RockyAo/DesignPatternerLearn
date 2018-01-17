//
//  main.swift
//  Adapter
//
//  Created by Rocky on 2018/1/16.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation


let search = SearchTool(dataSources: SalesDataSources(),DevelopmentDataSource(),NewCoDirectory())

print("--- lists ---")
search.employees.forEach { (e) in
    print("name: \(e.name)")
}

print("--- search ---")

search.search(text: "VP", type: .title).forEach { (e) in
    print("name: \(e.name) title: \(e.title)")
}
