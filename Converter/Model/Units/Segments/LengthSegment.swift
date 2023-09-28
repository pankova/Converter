//
//  LengthSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct LengthSegment: UnitSegment {
    static let allUnits: [UnitLength] = [
        .feet,
        .inches,
        .centimeters,
        .decimeters,
        .meters,
        .kilometers,
        .yards,
        .megameters,
        .hectometers,
        .decameters,
        .millimeters,
        .micrometers,
        .nanometers,
        .picometers,
        .miles,
        .scandinavianMiles,
        .lightyears,
        .nauticalMiles,
        .fathoms,
        .furlongs,
        .astronomicalUnits,
        .parsecs
    ]

    let type = SegmentType.length
    let keyedUnits: [Int: UnitLength]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }
}
