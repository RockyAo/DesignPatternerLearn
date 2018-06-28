//
//  DecryptionHandlerProtocol.swift
//  RWSecret
//
//  Created by Rocky on 2018/6/28.
//  Copyright © 2018年 Joshua Greene. All rights reserved.
//

import Foundation

public protocol DecryptionHandlerProtocol {
  var next: DecryptionHandlerProtocol? { get }
  func decrypt(data encryptedData: Data) -> String?
}
