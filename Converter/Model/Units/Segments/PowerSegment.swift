//
//  PowerSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct PowerSegment: UnitSegment {
    static let allUnits: [UnitPower] = [
        .terawatts,
        .gigawatts,
        .megawatts,
        .kilowatts,
        .watts,
        .milliwatts,
        .microwatts,
        .nanowatts,
        .picowatts,
        .femtowatts,
        .horsepower
    ]

    let type = SegmentType.power
    let keyedUnits: [Int: UnitPower]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
