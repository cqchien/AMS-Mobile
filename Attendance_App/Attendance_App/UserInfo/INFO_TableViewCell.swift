//
//  INFO_TableViewCell.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 16/May/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class INFO_TableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var lbl_content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbl_content.font = UIFont(name: "Roboto Regular", size: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
