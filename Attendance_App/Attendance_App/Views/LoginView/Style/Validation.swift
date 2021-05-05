





import Foundation
import UIKit
class Validation {
 
    public func validateEmailId(emailID: String) -> Bool {
        //
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
    }
    public func validatePassword(password: String) -> Bool {
        //Minimum 7 characters at least 1 Alphabet and 1 Number:
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{7,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        let isvalidatePass = validatePassord.evaluate(with: trimmedString)
        return isvalidatePass
    }
  

    // Check user and pass
    func validation(user : UITextField, pass : UITextField)
    {
        // using guard to unwrap the input fields
        guard let email = user.text, let password = pass.text else {
            return
        }
        
        let isValidateEmail = self.validateEmailId(emailID: email)
        
        if email.count == 0 {
            user.attributedPlaceholder = NSAttributedString(string: "Please enter ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            
        }
        
        if (isValidateEmail == false) {
            print("Incorrect Email")
            return
        } else{
            print("Email is correct" )
        }
       
        
        let isValidatePass = self.validatePassword(password: password)
        if (isValidatePass == false) {
            print("Incorrect Pass")
            return
        } else{
            print("Password is correct" )
        }
        if (isValidateEmail == true || isValidatePass == true) {
            print("All fields are correct")
        }
        
    }
    
}
