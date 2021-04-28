//
//  DataRequest.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

// get packet in json and send to web server

struct DataRequest: Codable {
    let email: String? // userName
    let password: String? // password
    let isMobileApp: Bool? // check whether api call is from mobile app
    
}
