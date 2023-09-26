//
//  EnergySegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct EnergySegment: UnitSegment {
    var units: [UnitEnergy] = [
        .joules,
        .calories,
        .kilojoules,
        .kilocalories,
        .kilowattHours
    ]
    let title = "Energy"
}
