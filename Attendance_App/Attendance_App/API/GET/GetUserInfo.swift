//
//  GetUserInfo.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 28/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

func GetUserInfo() {
    
    // get url
    let url = URL(string: "https://ams-be-yasu.herokuapp.com/auth/login")
    
    // guard url is valid
    guard let requestUrl = url else { fatalError() }
    
    var request = URLRequest(url: requestUrl)
    
    // Set http method
    request.httpMethod = "GET"
    
    // Get token from user defaults that stored on app before
    let token = UserDefaults.standard.data(forKey: "token")
    
    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer\(token!)", forHTTPHeaderField: "Authorization")
    
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
        }
        catch let jsonErr {
            print(jsonErr)
        }
    }
    task.resume()
    
}
