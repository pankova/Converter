//
//  ButtonPadViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import Foundation

@MainActor
final class ButtonPadViewModel: ObservableObject {

    var state: AppState!

    let buttonTypes: [[ButtonType]] = {
        [
            [.digit(.seven), .digit(.eight), .digit(.nine), .clearSymbol],
            [.digit(.four), .digit(.five), .digit(.six), .invert],
            [.digit(.one), .digit(.two), .digit(.three), .plusMinus],
            [.clearAll, .digit(.zero), .decimal]
        ]
    }()

    private var segmentService: SegmentService
    private var subscriptions = Set<AnyCancellable>()

    init(segmentService: SegmentService) {
        self.segmentService = segmentService
    }

    func setupSubscriptions() {
        state.action
            .sink(receiveValue: { [weak self] in self?.action($0) })
            .store(in: &subscriptions)
    }

    private func action(_ buttonType: ButtonType) {
        switch buttonType {
        case .clearSymbol:
            clearSymbol()
        case .clearAll:
            clear()
        case .invert:
            state.invertUnits.send()
        case .plusMinus:
            changeSign()
        default:
            addDigit(buttonType)
        }
    }

    private func addDigit(_ buttonType: ButtonType) {
        if buttonType == .decimal && state.value.contains(buttonType.description) {
            return
        }

        let shouldClearZeroSymbol = buttonType != .decimal && state.value == Constants.initialValue
        state.value = (shouldClearZeroSymbol ? "" : state.value) + buttonType.description
    }

    private func changeSign() {
        guard let numberValue = Double(state.value),
              numberValue != 0 else { return }
        state.value = NumberFormatter.outputFormatter.string(from: -numberValue)
    }

    private func clearSymbol() {
        guard state.value != Constants.initialValue else { return }
        state.value.count == 1 ? clear() : { state.value.removeLast() }()
    }

    private func clear() {
        guard state.value != Constants.initialValue else { return }
        state.value = Constants.initialValue
    }
}
