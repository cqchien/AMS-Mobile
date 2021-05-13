


import Foundation
import UIKit

class Validation {
 
    
    // Check user and pass
    func validation(user : UITextField, pass : UITextField, storyboard: UIStoryboard, view: UIView)
    {
        
        let userEmailStored = UserDefaults.standard.string(forKey: "email")
        let userPasswordStored = UserDefaults.standard.string(forKey: "password")
        let token = UserDefaults.standard.string(forKey: "accessToken")
        // using guard to unwrap the input fields
        guard let email = user.text, !email.isEmpty,
            let password = pass.text, !password.isEmpty else {
                user.attributedPlaceholder = NSAttributedString(string: "Please Enter Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                pass.attributedPlaceholder = NSAttributedString(string: "Please Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                return
        

        
        }
        
        if userEmailStored == email {
            if userPasswordStored == password {
                print("All correct")
                // Login successful
                TransitionHome(storyboard: storyboard, view: view)
                
            } else {
                print("Email & Password incorr ")
                // Login unsuccessful
            }
        }
        
//        if email.count != 0 && password.count != 0 {
//            TransitionHome(storyboard: storyboard, view: view)
//        }
    }
    
    // transition to home
    func TransitionHome(storyboard:UIStoryboard, view: UIView) {
        
        let classVC = storyboard.instantiateViewController(withIdentifier: constants.classViewController) as? ClassViewController
        
        view.window?.rootViewController = classVC
        view.window?.makeKeyAndVisible()
    }
    

    
}



