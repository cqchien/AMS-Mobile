//
//  GetUserInfo.swift
//  Attendance_App
//
//  Created by J.K on 5/7/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

class GetUserInfo:API {
    
    override init() {}

    func GetUserInfo() {
        
            // get url
        guard let URL = URL(string: "https://ams-be-yasu.herokuapp.com/auth/me") else {
            fatalError()
        }
        
            var request = URLRequest(url: URL)
        
            // Set http method
            request.httpMethod = "GET"
        
        // Get token from user defaults that stored on app before
        let token = UserDefaults.standard.string(forKey: "accessToken")
        
            // Set HTTP Request Header
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
         
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // guard we have data
                guard let data = data else {return}
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    //update status
                    self.status = httpResponse.statusCode
                    
                   
            }
                
                do {
                    
                    let result = try JSONDecoder().decode(User.self, from: data)
                    UserDefaults.standard.set(result.id!, forKey: "id")
                    UserDefaults.standard.set(result.createdAt!, forKey: "createdAt")
                    UserDefaults.standard.set(result.updatedAt!, forKey: "updatedAt")
                    UserDefaults.standard.set(result.role!, forKey: "role")
                    UserDefaults.standard.set(result.schoolYear!, forKey: "schoolYear")
                    UserDefaults.standard.set(result.email!, forKey: "email")
                    UserDefaults.standard.setValue(result.mainClass!, forKey: "mainClass")
                    UserDefaults.standard.set(result.studentCode!, forKey: "studentCode")
                    UserDefaults.standard.setValue(result.name!, forKey: "name")
//                    print(result)
                    print(response!)
                }
                catch let jsonErr {
                    print(jsonErr)
                
                }
                
            }
        
            task.resume()
    }
    
}
