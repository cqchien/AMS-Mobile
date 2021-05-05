





import Foundation
import UIKit


class styleLogin {
    
    
    static func styleTextField(_ textField:UITextField) {
        
        // Create lines bottom
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.size.height - 10, width: textField.frame.size.width + 2*textField.bounds.size.width , height: 1)
        bottomLine.backgroundColor = UIColor.init(red: 0.39, green: 1.00, blue: 0.90, alpha: 1.00).cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        textField.layer.masksToBounds = true
    }

    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled roundes corner style and add properties
        button.backgroundColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        // Size text in button
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)

    }
    
    static func styleColorText(_ label:UILabel) {
        // Color title
        label.textColor = UIColor.init(red: 0.05, green: 0.70, blue: 0.56, alpha: 1.00)
    }
    
    func addLeftImage(textField: UITextField, img: UIImage) {
        // Consider subview in the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        // Add icon left text field 
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        // Scale standard
        imageView.contentMode = .scaleAspectFit
        imageView.image = img
        // Add img in subview
        paddingView.addSubview(imageView)
        // Assign text field left = padding
        textField.leftView = paddingView;
        // add properties
        imageView.tintColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00)
        textField.leftViewMode = UITextField.ViewMode.always
    }
    
    // Notification func
    func Validation(text : UITextField) {
        
        guard let _ = text.text, text.text?.count != 0 else {
            text.attributedPlaceholder = NSAttributedString(string: "Please enter ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return
        }
    }
    
}
