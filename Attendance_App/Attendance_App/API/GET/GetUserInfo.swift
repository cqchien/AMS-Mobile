//
//  GetUserInfo.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 28/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

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
    print(token)
    let test = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImJiNDQ0ODQ2LTM4ZGQtNGU0YS1iZDg0LWJkODkzNjg5ZWQ2OSIsInJvbGUiOiJTVFVERU5UIiwiaWF0IjoxNjIwMDEyMjg2fQ.Gbo0_0NKsAOnwQlLfHfIVLaP2hkZWNtwWuWl7UALSbs"
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
    let headers: HTTPHeaders = ["Authorization": "Bearer \(test)", "Accept": "application/json"]
    AF.request("https://ams-be-yasu.herokuapp.com/auth/me",headers: headers).responseJSON { (response) in
        debugPrint(response)
    }
}   
