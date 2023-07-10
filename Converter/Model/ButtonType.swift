//
//  ButtonType.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import Foundation
import SwiftUI

enum ButtonType: CustomStringConvertible, Hashable {
    case digit(_ digit: Digit)
    case clearSymbol
    case clearAll
    case decimal
    case reverse

    var description: String {
        switch self {
        case let .digit(digit):
            return digit.description
        case .clearSymbol:
            return "←"
        case .clearAll:
            return "C"
        case .decimal:
            return "."
        case .reverse:
            return "⇆"
        }
    }

    var foregroundColor: Color {
        switch self {
        case .digit, .decimal:
            return .white
        case .clearSymbol, .clearAll, .reverse:
            return .white
        }
    }

    var backgroundColor: Color {
        switch self {
        case .digit, .decimal:
            return .gray
        case .clearSymbol, .clearAll, .reverse:
            return .black
        }
    }
}
