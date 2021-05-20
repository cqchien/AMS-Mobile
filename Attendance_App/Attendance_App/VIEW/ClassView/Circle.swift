//
//  Circle.swift
//  Attendance_App
//
//  Created by J.K on 5/19/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class Circle: UIView {
    
    func Drawcur(view: UIView)
    {
        let path = UIBezierPath();
        // line curve go to point x, y
        
        // scale to curved (tỷ lệ float)
        let radius: Double = Double(view.frame.size.height/2)
        let center1 = CGPoint(x: view.frame.size.width/4, y: -30)
        let center2 = CGPoint(x: -30, y: view.frame.size.height/3)
        
        path.move(to: CGPoint(x: center1.x + CGFloat(radius), y: center1.y))
        
        // half circle
        for i in stride(from: 0, to: 180.0, by: 10)
        {
            let radi = i * Double.pi / 180
            let x = Double(center1.x) + radius * cos(radi)
            let y = Double(center1.y) + radius * sin(radi)
            
            path.addLine(to: CGPoint(x: x,y: y))
            print(x,y)
            
        }
        
        
        path.move(to: CGPoint(x: center2.x + CGFloat(radius), y: center2.y))
        for i in stride(from: 0, to: 360.0, by: 10)
        {
            let radi = i * Double.pi / 180
            let x = Double(center2.x) + radius * cos(radi)
            let y = Double(center2.y) + radius * sin(radi)
            
            path.addLine(to: CGPoint(x: x,y: y))
            print(x,y)
            
        }
        
        
        
        // Add properties to the curve block
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00).cgColor
        layer.opacity = 0.4
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
    }
}
