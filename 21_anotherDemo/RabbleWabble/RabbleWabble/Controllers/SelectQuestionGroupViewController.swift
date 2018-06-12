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
    
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
    
    override public func viewDidLoad() {
        super.viewDidLoad()

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
        viewController.questionStategy = SequentialQuestionStategy(questionGroup: selectedQuestionGroup)
        
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

