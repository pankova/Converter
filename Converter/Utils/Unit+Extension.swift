//
//  Unit+Extension.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Foundation

extension Unit {
    var title: String {
        MeasurementFormatter.unitTitleFormatter.string(from: self)
    }
}
