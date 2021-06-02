//
//  data.swift
//  Attendance_App
//
//  Created by QUANG HUNG on 02/Jun/2021.
//  Copyright © 2021 J.K. All rights reserved.
//

import Foundation

struct dataSending: Codable {
    let classId: String
    let studentId: String
    let qrcode: String
}
