//
//  NumberViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

@MainActor
final class NumberViewModel: ObservableObject {

    var state: AppState!

    private var segmentService: SegmentService

    private var subscriptions = Set<AnyCancellable>()

    init(segmentService: SegmentService) {
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
            state.invert.send()
        case .plusMinus:
            changeSign()
        default:
            addDigit(buttonType)
        }
    }

    private func setupSubscriptions() {
        segmentService.currentSegment
            .sink(receiveValue: { [weak self] segment in
                self?.state.value = segment.value
            })
            .store(in: &subscriptions)
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
        state.value.count == 1 ? clear() : { state.value.removeLast() }()
    }

    private func clear() {
        state.value = Constants.initialValue
    }
}
