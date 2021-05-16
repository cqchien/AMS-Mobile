//
//  Token.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
import Security

// 1 user holds 1 token

struct Token: Codable {
    let expiresIn: Int? 
    let accessToken: String?
    
    
}
