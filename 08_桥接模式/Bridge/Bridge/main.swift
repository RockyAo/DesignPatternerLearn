//
//  main.swift
//  Bridge
//
//  Created by Rocky on 2018/1/18.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

var clearChannel = LandLine()
var secureChannel = SecureLandLine()

var comms = Communicator(clearChannel: clearChannel, secureChannel: secureChannel)


comms.sendSecureMessage("hello!")
comms.sendCleartextMessage("This is a secret")

