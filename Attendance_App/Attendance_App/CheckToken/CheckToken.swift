//
//  CheckToken.swift
//  Attendance_App
//
//  Created by J.K on 5/19/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit


func CheckToken(storyboard: UIStoryboard) {
    // save token user
    let saveToken = UserDefaults.standard.string(forKey: "accessToken")
    
    print("Check token : \(String(describing: saveToken))")
    
    if(saveToken == nil) {
        DispatchQueue.main.async {
            let homePage = storyboard.instantiateViewController(withIdentifier: "HomePage") as! ViewController
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = homePage
        }
    } else {return}
    
}
