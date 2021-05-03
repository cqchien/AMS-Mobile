

import UIKit
import Alamofire

@available(iOS 13.0, *)
class ViewController: UIViewController {

    @IBOutlet weak var imageHome: UIImageView!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var StackLogin: UIStackView!
    
    @IBOutlet weak var ValidationMessage: UILabel!
    
    // Action login
    
    @IBAction func LoginUser(_ sender: Any) {
        
        

        guard let _ = UsernameTextField.text, UsernameTextField.text?.count != 0 else
        {
            ValidationMessage.textColor = UIColor.red
            ValidationMessage.isHidden = false
            ValidationMessage.text = "Please enter valid username"
            return
        }
        
        guard let _ = PasswordTextField.text, PasswordTextField.text?.count != 0 else
        {
            ValidationMessage.textColor = UIColor.red
            ValidationMessage.isHidden = false
            ValidationMessage.text = "Please enter your password"
            return
        }
        APIRequest(email: UsernameTextField.text!, password: PasswordTextField.text!)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check wether user default has value
        
        if UserDefaults.standard.value(forKey: "token2") != nil {
            let info = self.storyboard?.instantiateViewController(identifier: "info") as! INFO_ViewController
            self.navigationController?.pushViewController(info, animated: true)
            GetUserInfo()
        }
        
        imageHome.image = UIImage(named: "book")
        setUpComponets()
        // Hiện thị curve
        styleLogin().Curved(amplitude: 100, view: self.view)
        // Ẩn label
        ValidationMessage.isHidden = true
        // Ẩn password
        PasswordTextField.isSecureTextEntry = true

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

    
}

