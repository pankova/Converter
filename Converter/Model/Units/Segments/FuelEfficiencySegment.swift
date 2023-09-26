//
//  FuelEfficiencySegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct FuelEfficiencySegment: UnitSegment {
    var units: [UnitFuelEfficiency] = [
        .litersPer100Kilometers,
        .milesPerGallon,
        .milesPerImperialGallon
    ]
    let title = "Fuel Efficiency"
}
