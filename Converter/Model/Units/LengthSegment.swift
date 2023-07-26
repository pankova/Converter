//
//  LengthSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct LengthSegment: UnitSegment {
    var units: [UnitLength] = [
        .feet,
        .inches,
        .centimeters,
        .decimeters,
        .meters,
        .kilometers,
        .yards,
    ]
    var title = "Length"
}
