//
//  VolumeSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct VolumeSegment: UnitSegment {
    var units: [UnitVolume] = [
        .cups,
        .gallons,
        .quarts,
        .liters,
        .pints,
        .tablespoons,
        .teaspoons
    ]
    var title = "Volume"
}
