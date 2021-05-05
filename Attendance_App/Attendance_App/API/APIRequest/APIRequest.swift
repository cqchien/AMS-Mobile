//
//  APIRequest.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

// post
func APIRequest(email: String , password: String)  {
    
    // get url
    let url = URL(string: "https://ams-be-yasu.herokuapp.com/auth/login")
    
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
            
            // Decode response from web server
            do{
                let result = try JSONDecoder().decode(DataReceive.self, from: data)
                
                // show result
                print("Response data:\n \(String(describing: result.token))")

            }catch let jsonErr{
                print(jsonErr)
           }
           
    }
    task.resume()
}