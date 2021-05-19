//
//  APIRequest.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//
import Foundation
import UIKit
import Security

class POST_API {
    
    // Title of alert
    var title = "Access Succeed"
    
    // Message of alert
    var message = "You Are Logged in successfully"
    
    var status = 0
    
    // Init of class
    init () {}
    
    // Call api to get user info
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
                return
            }
            
            // guard we have data
            guard let data = data else {return}
            
                if let httpResponse = response as? HTTPURLResponse {
                    
                    //update status
                    self.status = httpResponse.statusCode
                    
                    if httpResponse.statusCode <= 300 {
                           // do nothing
                    }
                    
                    else if httpResponse.statusCode == 400 {
                        
                            // Update title
                            self.title = "Access denied"
                        
                            // Update message
                            self.message = "Something Went Wrong"
                        
                            return
                    }
                    
                    else if httpResponse.statusCode == 401 {
                        
                            // Update title
                            self.title = "Access denied"
                        
                            // Update message
                            self.message = "You don't have permission to access"
                        
                            return
                    }
                    
                    else if httpResponse.statusCode == 403 {
                        
                            // Update title
                            self.title = "Access denied"
                        
                            // Update message
                            self.message = "Access is forbidden"
                        
                            return
                    }
                    
                    else if httpResponse.statusCode == 404 {
                        
                            // Update title
                            self.title = "Access denied"
                        
                            // Update message
                            self.message = "Something went wrong"
                        
                            return
                    }
                    
                    else if httpResponse.statusCode == 401 {
                        
                            // Update title
                            self.title = "Access denied"
                        
                            // Update message
                            self.message = "You don't have permission to access"
                        
                            return
                    }
                    
                    else if httpResponse.statusCode >= 406 {
                    
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
            
            // Decode response from web server
            do{
                let result = try JSONDecoder().decode(DataReceive.self, from: data)
                
                // store data on user default
                UserDefaults.standard.set(result.token?.expiresIn, forKey: "token2")
                print(result)
                
                UserDefaults.standard.set(result.token?.accessToken, forKey: "accessToken")
        
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }
        task.resume()
    }
    
}
