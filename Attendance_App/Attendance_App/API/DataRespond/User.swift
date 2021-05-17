//
//  User.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 24/Apr/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

// Response
// User infor
struct User: Codable {
    let id: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let name: String?
    let role: String?
    let schoolYear: String?
    let email: String?
    let mainClass: String?
    let studentCode: String?
}
