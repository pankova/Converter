//
//  EnergySegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct EnergySegment: UnitSegment {
    static let allUnits: [UnitEnergy] = [
        .joules,
        .calories,
        .kilojoules,
        .kilocalories,
        .kilowattHours
    ]

    let type = SegmentType.energy
    let keyedUnits: [Int: UnitEnergy]

    var initialUnits: [Int]
    var goalUnits: [Int]
    var value: String

    init (value: String = Constants.initialValue) {
        self.value = value
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
