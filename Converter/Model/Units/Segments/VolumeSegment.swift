//
//  VolumeSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct VolumeSegment: UnitSegment {
    let units: [UnitVolume] = [
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
    let title = "Volume"
}
