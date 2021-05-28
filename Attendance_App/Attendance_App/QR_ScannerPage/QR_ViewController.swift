//
//  QR_ViewController.swift
//  Attendance_App
//
//  Created by J.K on 5/28/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class QR_ViewController: UIViewController {

    var studentDetails: ClassDto?
    
    @IBOutlet weak var sourceCode: UILabel!
    
    @IBOutlet weak var studentID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sourceCode.text = studentDetails?.courseCode
        studentID.text = studentDetails?.id
        
    }
    

}
