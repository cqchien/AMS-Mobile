//
//  GetClassInfo.swift
//  Attendance_App
//
//  Created by J.K on 5/7/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit

// '@escaping' wait for response ipa
func GetClassInfo(comp: @escaping ([ClassDto])->())  {
    
    //get URL
    let url = URL(string: "https://ams-be-yasu.herokuapp.com/class")
    
    // guard url is valid
    guard let requestUrl = url else { fatalError() }
    
    var request = URLRequest(url: requestUrl)
    
    // Set http method
    request.httpMethod = "GET"
    
    // Get token from user defaults that stored on app before
    let token = UserDefaults.standard.string(forKey: "accessToken")

    // Set HTTP Request Header
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // guard we have data
        guard let jsonData = data else {
            print(data!)
            return
            
        }
        
        let decoder = JSONDecoder()
        
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(Class.self, from: jsonData)
            comp(result.data)
            //print(response!)
        } catch {
            print(error.localizedDescription)
            debugPrint(error)
        }
    }
    task.resume()

}
