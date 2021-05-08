//
//  GetUserInfo.swift
//  Attendance_App
//
//  Created by J.K on 5/7/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

func GetUserInfo() {
    
        // get url
    guard let URL = URL(string: "http://localhost:3000/auth/me") else {
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
            
            do {
                
                let result = try JSONDecoder().decode(User.self, from: data)
                
                print(result)
                print(response!)
            }
            catch let jsonErr {
                print(jsonErr)
            
            }
            
        }
    
        task.resume()
}
