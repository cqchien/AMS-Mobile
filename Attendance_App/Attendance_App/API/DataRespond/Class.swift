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
    let data: ClassDto?
}

struct ClassDto: Codable{
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
    let teacher: TeacherDto?
}

struct TeacherDto: Codable {
    let name: String?

    private enum role: String {
        case USER
        case STUDENT
        case TEACHER
        case ADMIN
        case TRAININGROOM
    }

    let avatarLink: String?
    let teacherCode: String?
    let email: String?
}

