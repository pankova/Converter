//
//  TemperatureSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct TemperatureSegment: UnitSegment {
    var units: [UnitTemperature] = [
        .celsius,
        .fahrenheit,
        .kelvin,
    ]
    let title = "Temperature"
}
