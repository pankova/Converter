//
//  ConverterService.swift
//  Converter
//
//  Created by Mariya Pankova on 25.07.2023.
//

import Foundation

struct ConverterService {

    static func convert(from initialUnit: Dimension, to goalUnit: Dimension, value: Double) -> String {
        let initial = Measurement<Dimension>(value: value, unit: initialUnit)
        let converted = initial.converted(to: goalUnit)
        return NumberFormatter.outputFormatter.string(from: converted.value)
    }
}
