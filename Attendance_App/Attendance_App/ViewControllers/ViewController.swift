//
//  ViewController.swift
//  Attendance_App
//
//  Created by J.K on 4/17/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageHome: UIImageView!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var StackLogin: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageHome.image = UIImage(named: "book")
        setUpComponets()
        Curved()
        // Chạy đồng bộ làm cho ứng dụng mượt hơn. Thực hiện delay trước khi chạy một khoảng thời gian truyền vào
        super.viewDidLayoutSubviews()
        
        // Hàm animation
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut , animations: {
        self.StackLogin.center.y -= self.view.bounds.height - 100
        self.StackLogin.layoutIfNeeded()
        }, completion: nil)
    }
    

    func setUpComponets() {
        styleLogin.styleTextField(UsernameTextField)
        styleLogin.styleTextField(PasswordTextField)
        
        // Login
        styleLogin.styleFilledButton(LoginButton)
        styleLogin.shadowView(LoginButton)
        
        //Stack
        styleLogin.shadowView(StackLogin)
    }

    
    
    func Curved (amplitude:CGFloat = 100)
    {
        // circlecurve
        let universalSize = self.view.bounds
        let baseLine = self.view.bounds.height/1.2
        let path = UIBezierPath();
        path.move(to: CGPoint(x: 0, y: baseLine))
        path.addCurve(to: CGPoint(x: 1 * universalSize.width, y: baseLine ), controlPoint1: CGPoint(x: universalSize.width * (0.3) , y: amplitude + baseLine), controlPoint2: CGPoint(x: universalSize.width * (0.7), y:-amplitude + baseLine))
        
        
        path.addLine(to: CGPoint(x: universalSize.width, y: universalSize.height))
        path.addLine(to: CGPoint(x: 0, y: universalSize.height))
        
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.init(red: 0.07, green: 0.93, blue: 0.75, alpha: 1.00).cgColor
        layer.opacity = 0.4
        layer.path = path.cgPath
        self.view.layer.addSublayer(layer)
        
        // animation
    }

}

