//
//  Logout.swift
//  Attendance_App
//
//  Created by J.K on 5/21/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import UIKit
func logOut () {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    let homePage = storyboard.instantiateViewController(withIdentifier: "HomePage")
    
    let appDelegate = UIApplication.shared.delegate
    
    appDelegate?.window??.rootViewController = homePage
    
    // Remove data token
    UserDefaults.standard.removeObject(forKey: "accessToken")
}
