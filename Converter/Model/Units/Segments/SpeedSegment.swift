//
//  SpeedSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct SpeedSegment: UnitSegment {

    static let allUnits: [UnitSpeed] = [
        .metersPerSecond,
        .kilometersPerHour,
        .milesPerHour,
        .knots
    ]

    let type = SegmentType.speed
    let keyedUnits: [Int: UnitSpeed]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
