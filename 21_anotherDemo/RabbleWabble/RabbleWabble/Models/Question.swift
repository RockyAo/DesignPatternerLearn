//
//  Question.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/11.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
