//
//  DurationSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct DurationSegment: UnitSegment {
    static let allUnits: [UnitDuration] = [
        .hours,
        .minutes,
        .seconds,
        .milliseconds,
        .microseconds,
        .nanoseconds,
        .picoseconds
    ]

    let type = SegmentType.duration
    let keyedUnits: [Int: UnitDuration]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
