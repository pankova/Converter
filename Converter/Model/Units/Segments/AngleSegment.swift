//
//  AngleSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct AngleSegment: UnitSegment {
    var units: [UnitAngle] = [
        .degrees,
        .arcMinutes,
        .arcSeconds,
        .radians,
        .gradians,
        .revolutions
    ]
    let title = "Angle"
}
