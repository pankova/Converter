//
//  MeasurementFormatter+Extension.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

extension MeasurementFormatter {
    static let unitTitleFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter
    }()
}
