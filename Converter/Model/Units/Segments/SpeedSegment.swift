//
//  SpeedSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct SpeedSegment: UnitSegment {
    let units: [UnitSpeed] = [
        .metersPerSecond,
        .kilometersPerHour,
        .milesPerHour,
        .knots
    ]
    let title = "Speed"
}
