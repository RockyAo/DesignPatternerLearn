//
//  PoolItem.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/23.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

protocol PoolItem {
    var canReuse:Bool{ get }
}
