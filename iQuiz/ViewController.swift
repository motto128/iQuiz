//
//  ViewController.swift
//  iQuiz
//
//  Created by Joe Motto on 2/13/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var topicList: [Topic] = []
    @IBAction func settingBtn(_ sender: UIBarButtonItem) {
        print("User has pressed the settings button.")
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
                                        NSLog("\"OK\" pressed.")
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: { _ in
                                        NSLog("\"Cancel\" pressed.")
        }))
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let mathTopic = Topic("Mathematics", "Additon & Subtraction", "math")
        let marvelTopic = Topic("Marvel Super Heroes", "Marvel comics", "marvel")
        let scienceTopic = Topic("Science", "Chemistry & Physics", "sci")
        
        let mathQuestion1 = Question("What is 2 + 2?", ["3", "4", "5", "6"], 2)
        let mathQuestion2 = Question("What is 13 - 8?", ["5", "13", "6", "7"], 1)
        mathTopic.questions = [mathQuestion1, mathQuestion2]
        
        let marvelQuestion1 = Question("Which superhero is Green?", ["Thor", "Hulk", "Flash", "Superman"], 2)
        let marvelQuestion2 = Question("Which superhero can fly", ["Hulk", "Flash", "Thor", "Ironman"], 4)
        marvelTopic.questions = [marvelQuestion1, marvelQuestion2]
        
        let scienceQuestion1 = Question("What metal is 'Au'?", ["Platinum", "Gold", "Copper", "Silver"], 2)
        let scienceQuestion2 = Question("Who founded E = MC^2", ["Albert Einstein", "John Locke", "Louis C.K.", "Isaac Newton"], 1)
        scienceTopic.questions = [scienceQuestion1, scienceQuestion2]
        topicList = [mathTopic, marvelTopic, scienceTopic]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let topic =  self.topicList[indexPath.row]
        cell.qImg.image = UIImage(named: topic.topicIcon + ".jpg")
        cell.qName.text = topic.topicTitle
        cell.qDisc.text = topic.topicDescription
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell #\(indexPath.row) selected")
        let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "questionView") as! QuestionViewController
        questionViewController.topic = self.topicList[indexPath.row]
        self.present(questionViewController, animated: true, completion: nil)
    }
}

