//
//  VolumeSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct VolumeSegment: UnitSegment {
    static let allUnits: [UnitVolume] = [
        .cups,
        .gallons,
        .quarts,
        .liters,
        .pints,
        .tablespoons,
        .teaspoons,
        .megaliters,
        .kiloliters,
        .deciliters,
        .centiliters,
        .milliliters,
        .cubicKilometers,
        .cubicMeters,
        .cubicDecimeters,
        .cubicCentimeters,
        .cubicMillimeters,
        .cubicInches,
        .cubicFeet,
        .cubicYards,
        .cubicMiles,
        .acreFeet,
        .bushels,
        .fluidOunces,
        .imperialTeaspoons,
        .imperialTablespoons,
        .imperialFluidOunces,
        .imperialPints,
        .imperialQuarts,
        .imperialGallons,
        .metricCups
    ]

    let type = SegmentType.volume
    let keyedUnits: [Int: UnitVolume]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }

}
