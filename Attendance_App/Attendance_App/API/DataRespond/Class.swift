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


//Create array
struct Class: Codable {
    let data: [ClassDto]
}

struct ClassDto: Codable {
    let id, createdAt, updatedAt: String?
    let deletedAt: JSONNull? // Represents 'null' in JSON
    let courseCode, type: String?
    let desc: JSONNull?
    let room, startTime, endTime: String?
    let qrCode: JSONNull?
    let teacher: TeacherDto?
}


enum TeacherDto: Codable {
    case string(String) // The return type has no value
    case teacherClass(TeacherClass) // The return type has value
    
    // Decoder/initialize if the teacher class has values
    init(from decoder: Decoder) throws {
        
        // Returns data stored in this decoder
        let container = try decoder.singleValueContainer()
        
        // Decoder value type string
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        
        // decode if the value is the Teacher class
        if let x = try? container.decode(TeacherClass.self) {
            self = .teacherClass(x)
            return
        }
        
        // Check error
        throw DecodingError.typeMismatch(TeacherDto.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TeacherDto"))
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

// Case Teacher
struct TeacherClass: Codable {
    let id, createdAt, updatedAt: String?
    let deletedAt: JSONNull?
    let name, role: String?
    let avatarLink: JSONNull?
    let email, teacherCode: String?
}


// Encode/Decoder json NULL
class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

