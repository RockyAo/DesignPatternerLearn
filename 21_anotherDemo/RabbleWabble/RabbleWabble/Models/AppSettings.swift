
//
//  AppSetting.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/12.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

public class AppSettings {
    
    // MARK: - Static Properties
    public static let shared = AppSettings()
    
    // MARK: - Instance Properties
    public var questionStrategyType = QuestionStrategyType.sequential
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(
            for: questionGroupCaretaker)
    }
}

// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int {
    
    public static let allCases: [QuestionStrategyType] = [.random, .sequential]
    case random
    case sequential
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        case .sequential:
            return SequentialQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        }
    }
    
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
}
