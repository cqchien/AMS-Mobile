

import UIKit

class ViewController: UIViewController {
    
    var cur:styleCurve = styleCurve()
    
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var StackLogin: UIStackView!
    @IBOutlet weak var TitleLogin: UILabel!
    
    // Action login
    
    @IBAction func LoginUser(_ sender: Any) {
       // APIRequest(email: UsernameTextField.text!, password: PasswordTextField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLayoutSubviews()
        // Main image
        imageHome.image = UIImage(named: "book")
        setUpComponets()
        
        // Animation function
//        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut , animations: {
//        self.StackLogin.center.y -= self.view.bounds.height - 100
//        self.StackLogin.layoutIfNeeded()
//        }, completion: nil)
        
        let imageUser = UIImage(named: "user")
        cur.addLeftImage(textField: UsernameTextField, img: imageUser!)
        let imagePass = UIImage(named: "password")
        cur.addLeftImage(textField: PasswordTextField, img: imagePass!)
    }
    

    func setUpComponets() {
        styleLogin.styleTextField(UsernameTextField)
        styleLogin.styleTextField(PasswordTextField)
        // Login
        styleLogin.styleFilledButton(LoginButton)
        // text color
        styleLogin.styleColorText(TitleLogin)
        cur.Curved()
    }


    
// Navigation
}

