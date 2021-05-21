//
//  CheckToken.swift
//  Attendance_App
//
//  Created by J.K on 5/19/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit


func checkToken() {
    // save token user
    let saveToken = UserDefaults.standard.string(forKey: "accessToken")
    
    print("Check token : \(String(describing: saveToken))")
    // check token
    if(saveToken == nil) {
        DispatchQueue.main.async {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homePage = storyboard.instantiateViewController(withIdentifier: "HomePage")
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = homePage
        
        }
    } else {
      DispatchQueue.main.async {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePage = storyboard.instantiateViewController(withIdentifier:  constants.classViewController)
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homePage
       }
    }
    
    return
}
