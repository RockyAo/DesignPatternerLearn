//
//  RandomQuestionStategy.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/12.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {
    
    private let questionGroup: QuestionGroup
    private var questionIndex: Int = 0
    private let questions: [Question]
    
    public var title: String {
        return questionGroup.title
    }
    
    public var correctCount: Int = 0
    
    public var incorrectCount: Int = 0
    
    public init(questionGroup: QuestionGroup){
        self.questionGroup = questionGroup
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
    
    
}
