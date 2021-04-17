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
        
        // Tạo dòng dưới
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.size.height - 10, width: textField.frame.size.width, height: 1)
        
        bottomLine.backgroundColor = UIColor.init(red: 0.39, green: 1.00, blue: 0.90, alpha: 1.00).cgColor
        
        textField.borderStyle = .none
        
        // Thêm dòng cho text field
        
        textField.layer.addSublayer(bottomLine)
        
        textField.layer.masksToBounds = true
        
    }
    
    
    static func shadowView(_ button:UIView) {
        
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 5
        
        // lưu bản vẽ vào cache
        button.layer.shouldRasterize = true
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled roundes corner style
        button.backgroundColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00)
            
        button.layer.cornerRadius = 25.0
        
        //Màu chữ
        button.tintColor = UIColor.white
        
        
        // Tạo độ nghiêng
        
    }

}
