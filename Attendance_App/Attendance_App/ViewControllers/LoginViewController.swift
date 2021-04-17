//
//  LoginViewController.swift
//  Attendance_App
//
//  Created by J.K on 4/17/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var ImageLogin: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageLogin.image = UIImage(named: "book")
        setUpLogin()
    }
    
    func setUpLogin() {
        styleLogin.styleTextField(usernameTextField)
        styleLogin.styleTextField(passwordTextField)
        styleLogin.styleFilledButton(LoginButton)
        
    }

}
