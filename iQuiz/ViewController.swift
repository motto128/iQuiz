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
    
    let qlab = ["Mathematics", "Marvel Super Heroes", "Science"]
    let qDescs = ["First Grade Level Math", "Marvel Movies & Comics", "Biology & Chemestry"]
    let qLogos = ["math","marvel", "sci"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qlab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.qImg.image = UIImage(named: qLogos[indexPath.row] + ".jpg")
        cell.qName.text = qlab[indexPath.row]
        cell.qDisc.text = qDescs[indexPath.row]
        return cell
    }
    
}

