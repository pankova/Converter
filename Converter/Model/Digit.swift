//
//  Digit.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine

    var description: String {
        "\(rawValue)"
    }
}
