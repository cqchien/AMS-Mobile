

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let cur: styleCurve = styleCurve()
    let login: styleLogin = styleLogin()
    var validation: Validation = Validation()
    var post = APIRequest()
    // Outlet login
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var TitleLogin: UILabel!
    @IBOutlet weak var SloganLogin: UILabel!
    
    // Spinner loading 
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Action login
    @IBAction func LoginUser(_ sender: Any) {
        
        // Check user name and password is nil or not
        if validation.validate(userName: UsernameTextField, password: PasswordTextField) == 1 {
            
            // Start spinning
            spinner.startAnimating()
            
            // Call api
            post.APIRequest(email: UsernameTextField.text!, password: PasswordTextField.text!)
            
            // Set timer for wating result of calling api
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                
                // Stop spinning
                self.spinner.stopAnimating()
                
                // Nofitication
                let alert = UIAlertController(title: self.post.title, message: self.post.message, preferredStyle: .alert)
                
                // Add button for this notification
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: self.handleHttpStatus))
                
                // Display nofitication
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            return
        }
    }
    
    
    // Get http status
    func handleHttpStatus(action: UIAlertAction) {
        if post.status <= 300 {
            validation.TransitionHome(storyboard: self.storyboard!, view: self.view)
        }
        else {
            return
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        super.viewDidLayoutSubviews()
        // Main image
        imageHome.image = UIImage(named: "book")
        // Curve func
        cur.Curved(amplitude: 100, view: self.view)
        
        // Components login
        cur.setUpComponets(user: UsernameTextField, pass: PasswordTextField, button: LoginButton, title: TitleLogin, slogan: SloganLogin)

        // Set up left icon
        let imageUser = UIImage(named: "user")
        login.addLeftImage(textField: UsernameTextField, img: imageUser!)
        let imagePass = UIImage(named: "password")
        login.addLeftImage(textField: PasswordTextField, img: imagePass!)
        
        // Keyboard
        self.UsernameTextField.delegate = self
        self.PasswordTextField.delegate = self
        keyboard()
        self.hideKeyboardWhenTappedAround()
        
        // Hide spinner after stopping
        spinner.hidesWhenStopped = true
        
    }
    

    func keyboard(){
         // register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

     @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Đồng bộ, cập nhập thay đổi layout ngay lập tức
            self.view.layoutIfNeeded()

            if self.view.frame.origin.y == 0 {
            // key board show is 1/5 view
                self.view.frame.origin.y -=  1/3*(keyboardSize.height)
            }
        }
    }

    // func when hide keyboar -> heigt = 0
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}



// Close keyboard by touching anywhere using Swift
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        }
    @objc func dismissKeyboard() {
        view.endEditing(true)
        }

    }


