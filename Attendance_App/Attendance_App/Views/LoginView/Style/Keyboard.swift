//
//  Keyboard.swift
//  Attendance_App
//
//  Created by J.K on 4/30/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class keyboard : UIViewController,UITextFieldDelegate {
   
    func notification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification,view : UIView) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            view.layoutIfNeeded()
            if view.frame.origin.y == 0 {
                view.frame.origin.y -=  1/5*(keyboardSize.height)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification, view : UIView) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
}
