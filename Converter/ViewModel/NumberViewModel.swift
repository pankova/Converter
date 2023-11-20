//
//  NumberViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

final class NumberViewModel: ObservableObject {

    private var calculationServise: CalculationServise
    private var segmentService: SegmentService

    private var value: String {
        get {
            calculationServise.value.value
        }
        set {
            calculationServise.update(with: newValue)
        }
    }

    init(calculationServise: CalculationServise,
         segmentService: SegmentService) {
        self.calculationServise = calculationServise
        self.segmentService = segmentService
    }

    func action(_ buttonType: ButtonType) {
        switch buttonType {
        case .clearSymbol:
            clearSymbol()
        case .clearAll:
            clear()
        case .invert:
            calculationServise.invert.send()
        case .plusMinus:
            changeSign()
        default:
            addDigit(buttonType)
        }
    }

    private func addDigit(_ buttonType: ButtonType) {
        if buttonType == .decimal && value.contains(buttonType.description) {
            return
        }
        if buttonType != .decimal && value == Constants.initialValue {
            value = ""
        }
        value += buttonType.description
    }

    private func changeSign() {
        guard let numberValue = Double(value),
              numberValue != 0 else { return }
        value = NumberFormatter.outputFormatter.string(from: -numberValue)
    }

    private func clearSymbol() {
        value.count == 1 ? clear() : { value.removeLast() }()
    }

    private func clear() {
        value = Constants.initialValue
    }
}
