//
//  AreaSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct AreaSegment: UnitSegment {
    static let allUnits: [UnitArea] = [
        .acres,
        .ares,
        .hectares,
        .squareCentimeters,
        .squareFeet,
        .squareInches,
        .squareKilometers,
        .squareMeters,
        .squareMegameters,
        .squareMillimeters,
        .squareMicrometers,
        .squareNanometers,
        .squareMiles,
        .squareYards
    ]

    let type = SegmentType.area
    let keyedUnits: [Int: UnitArea]

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
