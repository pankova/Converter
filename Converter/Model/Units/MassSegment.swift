//
//  MassSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct MassSegment: UnitSegment {
    var units: [UnitMass] = [
        .milligrams,
        .grams,
        .kilograms,
        .pounds,
        .ounces,
        .carats,
    ]
    var title = "Weight"
}
