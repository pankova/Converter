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
        .imperialGallons,
        .gallons,
        .liters,
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
        .metricCups,
//         https://developer.apple.com/forums/thread/739356
//        .imperialQuarts,
//        .quarts,
//        .imperialPints,
//        .pints,
//        .imperialTeaspoons,
//        .teaspoons,
//        .imperialTablespoons,
//        .tablespoons,
//        .imperialFluidOunces,
//        .fluidOunces,
    ]

    let type = SegmentType.volume
    let keyedUnits: [Int: UnitVolume]

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
