

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let cur: styleCurve = styleCurve()
    let login: styleLogin = styleLogin()
    
    var status:Int = 0
    var validation: Validation = Validation()
//    var post = APIRequest()
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

         //Check constraints when login
        
//        CheckToken(storyboard: self.storyboard!)
        
        if validation.validate(userName: UsernameTextField, password: PasswordTextField) == 1   {
            spinner.startAnimating()
            APIRequest(email: UsernameTextField.text!, password: PasswordTextField.text!)
        }
        
    }
    
    func APIRequest(email: String , password: String)  {
        
        // get url
        let url = URL(string: "http://localhost:3000/auth/login")
        
        // guard url is valid
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        
        // Set http method
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Get data from user
        let dataSending = DataRequest(email: email, password: password, isMobileApp: true)
        
        // Encode - json file
        let jsonData = try? JSONEncoder().encode(dataSending)
        
        // Get http body
        request.httpBody = jsonData
        
        // func call api
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // if it exists error -> show error -> exit
            if let error = error {
                print("Error took place \(error)")
                DispatchQueue.main.sync {
                    
                    let alert = UIAlertController(title: "Error", message: "Cannot log in, try again.", preferredStyle: .alert)

                    // Add button for this notification
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                    // Display nofitication
                    self.present(alert, animated: true, completion: nil)
                }
                
                return
            }
            
            // guard we have data
            guard let data = data else {return}
            
                if let httpResponse = response as? HTTPURLResponse {
                    
                    self.status = httpResponse.statusCode
                    //update status
                    DispatchQueue.main.async {
                        
                        self.spinner.stopAnimating()
                        if httpResponse.statusCode <= 300 {
                            self.validation.TransitionHome(storyboard: self.storyboard!, view: self.view)
                        }
                        else
                        {
                            self.showAlert(status: httpResponse.statusCode)
                            return
                        }
                    }
                   
            }
            
            // Decode response from web server
            do{
                let result = try JSONDecoder().decode(DataReceive.self, from: data)
                
                // store data on user default
                UserDefaults.standard.set(result.token?.expiresIn, forKey: "token2")
                UserDefaults.standard.set(result.token?.accessToken, forKey: "accessToken")
                
        
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }
        task.resume()
    }
    
    func showAlert(status: Int){
        var alert_title = ""
        var alert_message = ""
        let queue = DispatchQueue(label: "CheckStatus")
        queue.async {
            if (status <= 300 && status != 0) {
                return
            }
            else {
                // Update title
                alert_title = "Access denied"
                if status == 400 {
                        
                    // Update message
                    alert_message = "Something Went Wrong."

                    }
                    
                else if status == 401 {
                    
                    // Update message
                    alert_message = "You don't have permission to access."
                    
                    }
                
                else if status == 403 {
                    
                    // Update message
                    alert_message = "Access is forbidden."
                    
                    }
                else if status == 404 {
                    
                    // Update message
                    alert_message = "Incorrect email or password."
                    
                    }
                else {
                    
                    // Update message
                    alert_message = "Something went wrong."
                    
                    }
                DispatchQueue.main.async {
                    // Nofitication
                    let alert = UIAlertController(title: alert_title, message: alert_message, preferredStyle: .alert)
                    
                    
                    // Add button for this notification
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    // Display nofitication
                    self.present(alert, animated: true, completion: nil)
                }
                
                }
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
        // Hiden password
        PasswordTextField.isSecureTextEntry = true
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


