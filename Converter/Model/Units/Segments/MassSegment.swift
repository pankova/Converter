//
//  MassSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

struct MassSegment: UnitSegment {
    let units: [UnitMass] = [
        .milligrams,
        .grams,
        .kilograms,
        .pounds,
        .ounces,
        .carats,
        .centigrams,
        .decigrams,
        .metricTons,
        .micrograms,
        .nanograms,
        .ouncesTroy,
        .picograms,
        .shortTons,
        .slugs,
        .stones
    ]
    let title = "Weight"
}
