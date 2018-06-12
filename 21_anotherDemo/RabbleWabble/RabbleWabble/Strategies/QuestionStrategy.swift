//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/12.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    //选中问题的title
    var title: String { get }
    
    // 当前正确和错误的数量
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    func currentQuestion() -> Question
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    func questionIndexTitle() -> String
}
