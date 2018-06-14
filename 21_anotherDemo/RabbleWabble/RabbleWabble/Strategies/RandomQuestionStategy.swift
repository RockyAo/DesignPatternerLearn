//
//  RandomQuestionStategy.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/12.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(
            in: questionGroup.questions) as! [Question]
        self.init(questionGroupCaretaker: questionGroupCaretaker,
                  questions: questions)
    }
}
