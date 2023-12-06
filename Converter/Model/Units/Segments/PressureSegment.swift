//
//  PressureSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 03.12.2023.
//

import Foundation

struct PressureSegment: UnitSegment {
    static let allUnits: [UnitPressure] = [
        .bars,
        .gigapascals,
        .hectopascals,
        .inchesOfMercury,
        .kilopascals,
        .megapascals,
        .millibars,
        .millimetersOfMercury,
        .newtonsPerMetersSquared,
        .poundsForcePerSquareInch
    ]

    let type = SegmentType.pressure
    let keyedUnits: [Int: UnitPressure]

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
