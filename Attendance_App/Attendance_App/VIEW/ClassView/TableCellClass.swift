//
//  TableCellClass.swift
//  Attendance_App
//
//  Created by J.K on 5/15/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class TableCellClass: UITableViewCell {

    
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var courseCode: UILabel!
    
    @IBOutlet weak var nameTeacher: UILabel!
    
    @IBOutlet weak var room: UILabel!
    
    @IBOutlet weak var Attendance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundView.layer.borderWidth = 2
        self.roundView.layer.borderColor = UIColor(red: 0.05, green: 0.46, blue: 0.49, alpha: 1.00).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
