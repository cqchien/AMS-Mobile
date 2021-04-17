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
    
    @IBOutlet weak var loginHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageHome.image = UIImage(named: "book")
        setUpComponets()
        // Chạy đồng bộ làm cho ứng dụng mượt hơn. Thực hiện delay trước khi chạy một khoảng thời gian truyền vào
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
            self.animation()
        })
    }
    
    // Hàm animation
    func animation() {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
            //self.loginHome.center.y = self.view.bounds.height - 100
            self.loginHome.layoutIfNeeded()

        }, completion: nil)
    }
    func setUpComponets() {
        styleLogin.styleFilledButton(loginHome)
        styleLogin.shadowView(loginHome)
    }


}

