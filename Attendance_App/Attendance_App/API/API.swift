//
//  API.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 19/May/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class API {
    var title = "Access Succeed"
    
    // Message of alert
    var message = "You Are Logged in successfully"
    
    var status = 0
    
    // Init of class
    init () {}
    
    func checkStatus(){
        if status <= 300 && status != 0 {
               return
        }
        
        else if status == 400 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Something Went Wrong."
            
                return
        }
        
        else if status == 401 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "You don't have permission to access."
            
                return
        }
        
        else if status == 403 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Access is forbidden."
            
                return
        }
        
        else if status == 404 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Incorrect email or password."
            
                return
        }
        
        else if status == 401 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "You don't have permission to access."
            
                return
        }
        
        else if status == 422 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Wrong email format, try again."
            
                return
        }
        
        else if status >= 406  && status != 422 {
        
            // Update title
            self.title = "Access denied"
        
            // Update message
            self.message = "Oops, something went wrong. Please wait for a few minutes."
        
            return
        }
        
        else {
            
            // Update title
            self.title = "Access denied"
        
            // Update message
            self.message = "Oops, something went wrong. Please wait for a few minutes."
        
            return
        }
    }
}

func checkStatus(status:Int) {
    
    var alert_title: String = ""
    var alert_message: String = ""
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
                
            }
            
            }
    }
    
}
