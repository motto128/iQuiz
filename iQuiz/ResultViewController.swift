//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Joe Motto on 2/14/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctCount = 0
    var total = 0
    var topic: Topic?
    
    var percent = 0.0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percent = Double(correctCount) / Double(total)
        if percent < 0.5 {
            resLabel.text = "Fail!"
        } else if percent >= 0.5 && percent < 0.75 {
            resLabel.text = "Almost!"
        } else {
            resLabel.text = "Perfect!"
        }
        
        scoreLabel.text = "\(correctCount) out of \(total)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
