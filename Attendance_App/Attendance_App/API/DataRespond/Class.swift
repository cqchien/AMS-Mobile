//
//  Class.swift
//  Attendance_App
//
//  Created by J.K on 5/8/21.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

// Response
// Class infor
struct Class: Codable {
    let courseCode: String?
    let type: String?
    let desc: String?
    let room: String?
    let startTime: String?
    let endTime: String?
    let teacherId: String?
}
