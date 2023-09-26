//
//  PowerSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct PowerSegment: UnitSegment {
    var units: [UnitPower] = [
        .terawatts,
        .gigawatts,
        .megawatts,
        .kilowatts,
        .watts,
        .milliwatts,
        .microwatts,
        .nanowatts,
        .picowatts,
        .femtowatts,
        .horsepower
    ]
    let title = "Power"
}
