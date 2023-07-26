//
//  SpeedSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct SpeedSegment: UnitSegment {
    var units: [UnitSpeed] = [
        .metersPerSecond,
        .kilometersPerHour,
        .milesPerHour
    ]
    var title = "Speed"
}
