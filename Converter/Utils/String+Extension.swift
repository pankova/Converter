//
//  String+Extension.swift
//  Converter
//
//  Created by Mariya Pankova on 29.07.2023.
//

extension String {
    var doubleOrZero: Double {
        Double(self) ??  0.0
    }
}
