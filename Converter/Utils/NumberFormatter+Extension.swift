//
//  NumberFormatter+Extension.swift
//  Converter
//
//  Created by Mariya Pankova on 01.08.2023.
//

import Foundation

extension NumberFormatter {
    static let outputFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 10
        formatter.decimalSeparator = ButtonType.decimal.description
        return formatter
    }()

    func string(from number: Double) -> String {
        string(from: NSNumber(value: number)) ?? ""
    }
}
