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


////Create array
struct Class: Codable {
    let data: [ClassDto]
}
// MARK: - ClassDto
struct ClassDto: Codable {
    let id, createdAt, updatedAt: String?
    let deletedAt: String?
    let courseCode, type: String?
    let desc: String?
    let room, startTime, endTime: String?
    let qrCode: String?
    let teacher: TeacherDto?
}


enum TeacherDto: Codable {
    case string(String)
    case teacherClass(TeacherClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(TeacherClass.self) {
            self = .teacherClass(x)
            return
        }
        throw DecodingError.typeMismatch(TeacherDto.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TeacherUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .teacherClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - TeacherClass
struct TeacherClass: Codable {
    let id, createdAt, updatedAt, deletedAt: String?
    let name, role, avatarLink, email: String?
    let teacherCode: String?
}



