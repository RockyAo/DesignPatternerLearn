//
//  Command.swift
//  Command
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Command {
    func excute()
}

class GenericCommand<T>: Command {
   
    
    private var receiver:T
    private var instructions:(T)->Void
    
    init(receiver:T , instructions:@escaping (T)->Void ) {
        self.receiver = receiver
        self.instructions = instructions
    }
    
    func excute() {
        instructions(receiver)
    }
    
    class func createCommand(receiver:T , instuctions:@escaping (T)->Void) -> Command{
        return GenericCommand(receiver: receiver, instructions: instuctions)
    }
}
