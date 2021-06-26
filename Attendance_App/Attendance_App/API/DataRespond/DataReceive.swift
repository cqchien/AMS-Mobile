//
//  DataReceive.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation
struct DataReceive: Codable {
    let user: User?
    let role:String?
    let token: Token?
}
