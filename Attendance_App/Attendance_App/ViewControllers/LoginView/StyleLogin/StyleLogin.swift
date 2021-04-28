//
//  ColorHome.swift
//  Attendance_App
//
//  Created by J.K on 4/17/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit


class styleLogin {
    
    static func styleTextField(_ textField:UITextField) {
        
        // Create lines bottom
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.size.height - 10, width: textField.frame.size.width + 2*textField.bounds.size.width , height: 1)
        bottomLine.backgroundColor = UIColor.init(red: 0.39, green: 1.00, blue: 0.90, alpha: 1.00).cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        textField.layer.masksToBounds = true
    }

    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled roundes corner style
        button.backgroundColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

    }
    
    static func styleColorText(_ label:UILabel) {
        // Color title
        label.textColor = UIColor.init(red: 0.09, green: 0.72, blue: 0.64, alpha: 1.00)
    }
    

}
