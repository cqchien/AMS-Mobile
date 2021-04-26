

import UIKit

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
        // Do any additional setup after loading the view, typically from a nib.
        imageHome.image = UIImage(named: "book")
        setUpComponets()
        // Hiện thị curve
        Curved()
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

    
    
    func Curved (amplitude:CGFloat = 100)
    {
        // circlecurve
        let universalSize = self.view.bounds
        let baseLine = self.view.bounds.height/1.2
        let path = UIBezierPath();
        // AddLine chạy từ point x,y
        path.move(to: CGPoint(x: 0, y: baseLine))
        // tỷ lệ chạy của curved (tỷ lệ float)
        path.addCurve(to: CGPoint(x: 1 * universalSize.width, y: baseLine ), controlPoint1: CGPoint(x: universalSize.width * (0.3) , y: amplitude + baseLine), controlPoint2: CGPoint(x: universalSize.width * (0.7), y:-amplitude + baseLine))
        // Line chạy từ
        path.addLine(to: CGPoint(x: universalSize.width, y: universalSize.height))
        path.addLine(to: CGPoint(x: 0, y: universalSize.height))

        // Thêm thuộc tính cho khối cuverd đã tạo
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.init(red: 0.07, green: 0.93, blue: 0.75, alpha: 1.00).cgColor
        layer.opacity = 0.4
        layer.path = path.cgPath
        self.view.layer.addSublayer(layer)
    }

}

