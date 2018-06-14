//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/11.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

public class QuestionGroup: Codable {
    
    public class Score: Codable {
        public var correctCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }
        public var incorrectCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }
        public init() { }
        
        public lazy var runningPercentage = Observable(calculateRunningPercentage())
        
        private func calculateRunningPercentage() -> Double {
            let totalCount = correctCount + incorrectCount
            guard totalCount > 0 else {
                return 0
            }
            
            return Double(correctCount) / Double(totalCount)
        }
        
        private func updateRunningPercentage() {
            runningPercentage.value = calculateRunningPercentage()
        }
        
        public func reset() {
            correctCount = 0
            incorrectCount = 0
        }
    }
    
    public let questions: [Question]
    public private(set) var score: Score
    public let title: String
    
    public init(questions: [Question],
                score: Score = Score(),
                title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
