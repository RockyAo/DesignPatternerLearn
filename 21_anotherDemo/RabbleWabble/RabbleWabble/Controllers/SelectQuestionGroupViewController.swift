//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Rocky on 2018/6/12.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {

    @IBOutlet internal var tableView: UITableView! {
        didSet{
            tableView.tableFooterView = UIView()
        }
    }
    
    private let questionGroupCaretaker = QuestionGroupCaretaker()
    
    public var questionGroups: [QuestionGroup] {
        return questionGroupCaretaker.questionGroups
    }
    
    private var selectedQuestionGroup: QuestionGroup! {
        get { return questionGroupCaretaker.selectedQuestionGroup }
        set { questionGroupCaretaker.selectedQuestionGroup = newValue }
    }
    
    private let appSetting = AppSettings.shared
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        questionGroups.forEach {
            print("\($0.title): " + "correctCount \($0.score.correctCount)" + "incorrectCount: \($0.score.incorrectCount)")
        }
    }
    
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell", for: indexPath) as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        questionGroup.score.runningPercentage.addObserver(cell, options: [.initial, .new]) { [weak cell] (percentage, _) in
            DispatchQueue.main.async {
                cell?.percentageLabel.text = String(format: "%.0f %%", round(100 * percentage))
            }
        }
        return cell
    }
}

extension SelectQuestionGroupViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController =  segue.destination as? QuestionViewController else { return }
//        viewController.questionGroup = selectedQuestionGroup
//        viewController.questionStategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
//        viewController.questionStategy = SequentialQuestionStategy(questionGroup: selectedQuestionGroup)
        viewController.questionStategy = appSetting.questionStrategy(for: questionGroupCaretaker)
        viewController.delegate = self
    }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate{
    
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy, at questionIndex: Int) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy) {
        
        navigationController?.popToViewController(self, animated: true)
    }
}

