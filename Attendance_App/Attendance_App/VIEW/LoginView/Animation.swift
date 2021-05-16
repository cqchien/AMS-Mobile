//
//  Animation.swift
//  Attendance_App
//
//  Created by J.K on 4/30/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class Animation : UIViewController {
    
    func imageLaunch() -> UIImageView {
     let imageLaunch = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageLaunch.image = UIImage(named: "book")
        return imageLaunch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageLaunch())
        view.backgroundColor = UIColor.red
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageLaunch().center = view.center
    }
}
