


import Foundation
import UIKit

class Validation {
 
    
    // Check user and password is nil or not
    func validate(userName: UITextField, password: UITextField) -> Int {
        
        // Check if password or userName is nil or not
        if userName.text?.count == 0 || password.text?.count == 0 {
            
            // Check userName is nil. If nil => show notification
            if userName.text?.count == 0 {
                
                notify(name: userName)
        
            }
            
            // Check userName is nil. If nil => show notification
            if password.text?.count == 0 {
                
                notify(name: password)
                
            }
            
            return -1
        }
        
        // If statement is Wrong => return 1 
        return 1
    }
    
    func notify (name: UITextField) {
        name.attributedPlaceholder = NSAttributedString(string: "Please Enter This Information", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
    }
    
    // Move to Class VC
    func TransitionHome(storyboard:UIStoryboard, view: UIView) {
        
        let classVC = storyboard.instantiateViewController(withIdentifier: constants.classViewController) as? ClassViewController
        
        view.window?.rootViewController = classVC
        view.window?.makeKeyAndVisible()
    }
    
    func pushVC (httpStatus:Int,storyboard:UIStoryboard, view: UIView)
    {
        if httpStatus <= 300 {
            TransitionHome(storyboard: storyboard, view: view)
        }
        else {
            return
        }
    }
}



