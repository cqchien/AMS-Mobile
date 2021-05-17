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
        
        courseCode.textColor = UIColor.init(red: 0.05, green: 0.46, blue: 0.49, alpha: 1.00)
        courseCode.font = UIFont(name: "Roboto", size: 25.0)
        
        colorLabel(label: nameTeacher)
        colorLabel(label: room)
        colorLabel(label: Attendance)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func colorLabel(label:UILabel){
        label.textColor = UIColor.init(red: 0.05, green: 0.46, blue: 0.49, alpha: 1.00)
        label.font = UIFont(name: "Roboto", size: 20.0)
        
        // make shadow
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
    }

}
