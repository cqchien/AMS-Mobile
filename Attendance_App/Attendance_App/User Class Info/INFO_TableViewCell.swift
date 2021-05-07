//
//  INFO_TableViewCell.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 07/May/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class INFO_TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var lbl_content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
