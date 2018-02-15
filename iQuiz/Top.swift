//
//  Top.swift
//  iQuiz
//
//  Created by Joe Motto on 2/14/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class Topic: NSObject {
    var questions: [Question] = []
    var topicTitle: String = ""
    var topicDescription: String = ""
    var topicIcon: String = ""
    
    init(_ topicTitle : String, _ topicDescription : String, _ icon : String) {
        self.topicTitle = topicTitle
        self.topicDescription = topicDescription
        self.topicIcon = icon
    }
}
