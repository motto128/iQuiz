//
//  CustomTableViewCell.swift
//  iQuiz
//
//  Created by Joe Motto on 2/13/18.
//  Copyright © 2018 Joe Motto. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var qImg: UIImageView!
    @IBOutlet weak var qName: UILabel!
    @IBOutlet weak var qDisc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
