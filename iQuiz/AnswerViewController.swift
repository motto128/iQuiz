//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Joe Motto on 2/14/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var currentQuestion: Question?
    var topic: Topic?
    var answer = 0
    var correctCount = 0
    var questionNum = 1
    
    @IBOutlet weak var currQ: UILabel!
    @IBOutlet weak var corrA: UILabel!
    @IBOutlet weak var descA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currQ.text = "Question #\(questionNum): " + (currentQuestion?.question)!
        corrA.text = currentQuestion?.options[((currentQuestion?.correctAnswerIndex)! - 1)]
        if(answer == currentQuestion?.correctAnswerIndex) {
            correctCount += 1
            descA.text = "You are correct"
        } else {
            descA.text = "Incorrect Answer :("
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if questionNum < (topic?.questions.count)! {
            performSegue(withIdentifier: "nextQuestion", sender: self)
        } else {
            let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
            resultViewController.total = self.questionNum
            resultViewController.correctCount = self.correctCount
            resultViewController.topic = self.topic
            self.present(resultViewController, animated: true, completion: nil)
        }
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
