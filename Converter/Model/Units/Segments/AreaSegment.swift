//
//  AreaSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct AreaSegment: UnitSegment {
    var units: [UnitArea] = [
        .acres,
        .ares,
        .hectares,
        .squareCentimeters,
        .squareFeet,
        .squareInches,
        .squareKilometers,
        .squareMeters,
        .squareMegameters,
        .squareMillimeters,
        .squareMicrometers,
        .squareNanometers,
        .squareMiles,
        .squareYards
    ]
    let title = "Area"
}
