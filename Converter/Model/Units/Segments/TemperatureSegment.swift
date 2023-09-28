//
//  TemperatureSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct TemperatureSegment: UnitSegment {
    static let allUnits: [UnitTemperature] = [
        .celsius,
        .fahrenheit,
        .kelvin,
    ]

    let type = SegmentType.temperature
    let keyedUnits: [Int: UnitTemperature]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
