//
//  QuestionViewController.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/11.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

protocol QuestionViewControllerDelegate: class {
    func questionViewController(_ viewController: QuestionViewController,
                                didCancel questionGroup: QuestionStrategy,
                                at questionIndex: Int)
    
    func questionViewController(_ viewController: QuestionViewController,
                                didComplete questionGroup: QuestionStrategy)
}

public class QuestionViewController: UIViewController {
    
    weak var delegate: QuestionViewControllerDelegate?
    
    public var questionStategy: QuestionStrategy! {
        didSet{
            navigationItem.title = questionStategy.title
        }
    }
    
    public var questionGroup: QuestionGroup! {
        didSet{
            navigationItem.title = questionGroup.title
        }
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "",
                                  style: .plain,
                                  target: nil,
                                  action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    public var questionIndex = 0
    public var correctCount = 0
    public var incorrectCount = 0
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return view as? QuestionView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showQuestion()
    }
    
    private func setupCancelButton(){
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(self,
                                         didCancel: questionStategy,
                                         at: questionIndex)
    }
    
    private func showQuestion() {
        let question = questionStategy.currentQuestion()
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        questionIndexItem.title = questionStategy.questionIndexTitle()
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        let question = questionStategy.currentQuestion()
        questionStategy.markQuestionCorrect(question)
        questionView.correctCountLabel.text = String(questionStategy.correctCount)
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        let question = questionStategy.currentQuestion()
        questionStategy.markQuestionIncorrect(question)
        questionView.incorrectCountLabel.text = String(questionStategy.incorrectCount)
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        guard questionStategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self, didComplete: questionStategy)
            return
        }
        showQuestion()
    }
}
