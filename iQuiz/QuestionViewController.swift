//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Joe Motto on 2/14/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var topic: Topic?
    var questionNum = 1
    var question: Question?
    var selectedAnswer = 0
    var correctCount = 0
    
    @IBOutlet weak var qTitle: UILabel!
    @IBOutlet weak var opt1: UIButton!
    @IBOutlet weak var opt2: UIButton!
    @IBOutlet weak var opt3: UIButton!
    @IBOutlet weak var opt4: UIButton!
    
    @IBAction func answerT(_ sender: UIButton) {
        opt1.backgroundColor = UIColor.lightGray
        opt2.backgroundColor = UIColor.lightGray
        opt3.backgroundColor = UIColor.lightGray
        opt4.backgroundColor = UIColor.lightGray
        sender.backgroundColor = UIColor.blue
        selectedAnswer = sender.tag
    }
   
    @IBAction func submit(_ sender: Any) {
        let answerViewController = self.storyboard?.instantiateViewController(withIdentifier: "answerView") as! AnswerViewController
        answerViewController.topic = self.topic
        answerViewController.currentQuestion = self.question
        answerViewController.answer = self.selectedAnswer
        answerViewController.questionNum = self.questionNum
        answerViewController.correctCount = self.correctCount
        self.present(answerViewController, animated: false, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        question = topic?.questions[questionNum - 1]
        qTitle.text = "Question #\(questionNum): " + (question?.question)!
        opt1.setTitle(question?.options[0], for: .normal)
        opt2.setTitle(question?.options[1], for: .normal)
        opt3.setTitle(question?.options[2], for: .normal)
        opt4.setTitle(question?.options[3], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
