//
//  AngleSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct AngleSegment: UnitSegment {
    static let allUnits: [UnitAngle] = [
        .degrees,
        .arcMinutes,
        .arcSeconds,
        .radians,
        .gradians,
        .revolutions
    ]

    let type = SegmentType.angle
    let keyedUnits: [Int: UnitAngle]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
