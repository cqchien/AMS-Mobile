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
    let data: [ClassDto]
    private enum CodingKeys: String, CodingKey {
        case data
    }

}

struct ClassDto: Codable
{
    let id: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let courseCode: String?
    let type: String?
    let desc: String?
    let room: String?
    let startTime: String?
    let endTime: String?
    let qrCode: String?
    let teacher: TeacherDto

    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case updatedAt
        case deletedAt
        case courseCode
        case type
        case desc
        case room
        case startTime
        case endTime
        case qrCode
        case teacher
    }
    
}

struct TeacherDto: Codable {
    let name: String?
    let teacherCode: String?
    let email: String?
    private enum CodingKeys: String, CodingKey {
        case name, teacherCode, email
    }
}
