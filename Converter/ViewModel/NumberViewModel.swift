//
//  NumberViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

final class NumberViewModel: ObservableObject {

    private var calculationService: CalculationValueService
    private var segmentService: SegmentService

    private var value: String {
        get {
            calculationService.value.value
        }
        set {
            calculationService.update(with: newValue)
        }
    }

    private var subscriptions = Set<AnyCancellable>()

    init(calculationService: CalculationValueService,
         segmentService: SegmentService) {
        self.calculationService = calculationService
        self.segmentService = segmentService
    }

    func viewDidAppear() {
        setupSubscriptions()
    }

    func action(_ buttonType: ButtonType) {
        switch buttonType {
        case .clearSymbol:
            clearSymbol()
        case .clearAll:
            clear()
        case .invert:
            calculationService.invert.send()
        case .plusMinus:
            changeSign()
        default:
            addDigit(buttonType)
        }
    }

    private func setupSubscriptions() {
        segmentService.currentSegment
            .sink(receiveValue: { [weak self] segment in
                self?.value = segment.value
            })
            .store(in: &subscriptions)
    }

    private func addDigit(_ buttonType: ButtonType) {
        if buttonType == .decimal && value.contains(buttonType.description) {
            return
        }

        let shouldClearZeroSymbol = buttonType != .decimal && value == Constants.initialValue
        value = (shouldClearZeroSymbol ? "" : value) + buttonType.description
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
