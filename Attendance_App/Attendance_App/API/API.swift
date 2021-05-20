//
//  API.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 19/May/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

class API {
    var title = "Access Succeed"
    
    // Message of alert
    var message = "You Are Logged in successfully"
    
    var status = 0
    
    // Init of class
    init () {}
    
    func checkStatus(){
        if status <= 300 {
               // do nothing
        }
        
        else if status == 400 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Something Went Wrong"
            
                return
        }
        
        else if status == 401 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "You don't have permission to access"
            
                return
        }
        
        else if status == 403 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Access is forbidden"
            
                return
        }
        
        else if status == 404 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "Something went wrong"
            
                return
        }
        
        else if status == 401 {
            
                // Update title
                self.title = "Access denied"
            
                // Update message
                self.message = "You don't have permission to access"
            
                return
        }
        
        else if status >= 406 {
        
            // Update title
            self.title = "Access denied"
        
            // Update message
            self.message = "Oops, something went wrong. Please wait for a few minutes"
        
            return
        }
        
        else {
            
            // Update title
            self.title = "Access denied"
        
            // Update message
            self.message = "Oops, something went wrong. Please wait for a few minutes"
        
            return
        }
    }
}
