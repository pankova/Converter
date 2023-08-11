//
//  FuelEfficiencySegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct FuelEfficiencySegment: UnitSegment {
    let units: [UnitFuelEfficiency] = [
        .litersPer100Kilometers,
        .milesPerGallon,
        .milesPerImperialGallon
    ]
    let title = "Fuel Efficiency"
}
