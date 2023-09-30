//
//  MassSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct MassSegment: UnitSegment {

    static let allUnits: [UnitMass] = [
        .milligrams,
        .grams,
        .kilograms,
        .pounds,
        .ounces,
        .carats,
        .centigrams,
        .decigrams,
        .metricTons,
        .micrograms,
        .nanograms,
        .ouncesTroy,
        .picograms,
        .shortTons,
        .slugs,
        .stones
    ]

    let type = SegmentType.mass
    let keyedUnits: [Int: UnitMass]
    
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
