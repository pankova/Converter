//
//  FuelEfficiencySegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct FuelEfficiencySegment: UnitSegment {
    static let allUnits: [UnitFuelEfficiency] = [
        .litersPer100Kilometers,
        .milesPerGallon,
        .milesPerImperialGallon
    ]

    let type = SegmentType.fuel
    let keyedUnits: [Int: UnitFuelEfficiency]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
