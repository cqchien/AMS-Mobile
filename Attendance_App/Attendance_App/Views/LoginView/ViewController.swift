

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let cur: styleCurve = styleCurve()
    let login: styleLogin = styleLogin()
    
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var StackLogin: UIStackView!
    @IBOutlet weak var TitleLogin: UILabel!
    
    @IBOutlet weak var SloganLogin: UILabel!
    // Action login
    
    @IBAction func LoginUser(_ sender: Any) {
       // APIRequest(email: UsernameTextField.text!, password: PasswordTextField.text!)
        login.Validation(text: UsernameTextField)
        login.Validation(text: PasswordTextField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLayoutSubviews()
        // Main image
        imageHome.image = UIImage(named: "book")
        // Curve func
        cur.Curved(amplitude: 100, view: self.view)
        
        cur.setUpComponets(user: UsernameTextField, pass: PasswordTextField, button: LoginButton, title: TitleLogin, slogan: SloganLogin)

        // Set up left icon
        let imageUser = UIImage(named: "user")
        styleLogin().addLeftImage(textField: UsernameTextField, img: imageUser!)
        let imagePass = UIImage(named: "password")
        styleLogin().addLeftImage(textField: PasswordTextField, img: imagePass!)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    

}

