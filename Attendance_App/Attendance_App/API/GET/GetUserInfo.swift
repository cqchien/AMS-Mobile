//
//  GetUserInfo.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 28/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

// phần chú thích là phần GET method bằng cách bình thường không sử dụng alamofire. Toàn cân nhắc sử dụng các thường cho các phần gọi api của mình.

import Foundation
import Alamofire
import UIKit
func GetUserInfo() {
    
//    // get url
//    let url = URL(string: "https://ams-be-yasu.herokuapp.com/auth/me")
//
//    // guard url is valid
//    guard let requestUrl = url else { fatalError() }
//
//    var request = URLRequest(url: requestUrl)
//
//    // Set http method
//    request.httpMethod = "GET"
//
    // Get token from user defaults that stored on app before
    let token = UserDefaults.standard.string(forKey: "accessToken")

    
//    // Set HTTP Request Header
//    request.addValue("application/json", forHTTPHeaderField: "Accept")
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//        if let error = error {
//            print("Error took place \(error)")
//            return
//        }
//
//        // guard we have data
//        guard let data = data else {return}
//
//        do {
//
//            let result = try JSONDecoder().decode(User.self, from: data)
//
//            print(result)
//            print(response)
//        }
//        catch let jsonErr {
//            print(jsonErr)
//        }
//    }
//    task.resume()
    let headers: HTTPHeaders = ["Authorization": "Bearer \(token!)", "Accept": "application/json"]
    AF.request("https://ams-be-yasu.herokuapp.com/auth/me",headers: headers).responseJSON { (response) in
        debugPrint(response)
    }
}   
    