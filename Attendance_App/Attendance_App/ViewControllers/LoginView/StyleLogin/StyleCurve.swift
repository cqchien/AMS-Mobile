//
//  StyleCurve.swift
//  Attendance_App
//
//  Created by J.K on 4/28/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class styleCurve : UIViewController {
        
    func Curved (amplitude:CGFloat = 100)
        {
            // circlecurve
            let universalSize = self.view.bounds
            let baseLine = self.view.bounds.height/1.2
            let path = UIBezierPath();
            // AddLine chạy từ point x,y
            path.move(to: CGPoint(x: 0, y: baseLine))
            // tỷ lệ chạy của curved (tỷ lệ float)
            path.addCurve(to: CGPoint(x: 1 * universalSize.width, y: baseLine ), controlPoint1: CGPoint(x: universalSize.width * (0.3) , y: amplitude + baseLine), controlPoint2: CGPoint(x: universalSize.width * (0.7), y:-amplitude + baseLine))
            // Line chạy từ
            path.addLine(to: CGPoint(x: universalSize.width, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            // Thêm thuộc tính cho khối cuverd đã tạo
            let layer = CAShapeLayer()
            layer.fillColor = UIColor.init(red: 0.07, green: 0.93, blue: 0.75, alpha: 1.00).cgColor
            layer.opacity = 0.4
            layer.path = path.cgPath
            self.view.layer.addSublayer(layer)
        }
    
    
    func addLeftImage(textField: UITextField, img: UIImage) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = img
        textField.leftView = imageView;
        imageView.tintColor = UIColor.lightGray
        textField.leftViewMode = UITextField.ViewMode.always
    }
}
