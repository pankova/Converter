//
//  UnitConverterViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

final class UnitConverterViewModel: ObservableObject {

    @Published var initialIndex: Int
    @Published var goalIndex: Int

    @Published private(set) var value: String
    @Published private(set) var convertedValue: String
    @Published private(set) var segment: any UnitSegment

    private let calculationService: CalculationValueService
    private let segmentService: any SegmentService
    private var subscriptions = Set<AnyCancellable>()

    init(
        initialIndex: Int,
        goalIndex: Int,
        convertedValue: String,
        calculationService: CalculationValueService,
        segmentService: any SegmentService) {
            self.initialIndex = initialIndex
            self.goalIndex = goalIndex
            self.value = calculationService.value.value
            self.segment = segmentService.currentSegment.value
            self.convertedValue = convertedValue
            self.calculationService = calculationService
            self.segmentService = segmentService

            setupSubscriptions()
        }

    func recalculate() {
        guard value != Constants.initialValue else {
            convertedValue = Constants.initialValue
            return
        }

        convertedValue = ConverterService.convert(
            from: segment.initialUnitsValue[initialIndex],
            to: segment.goalUnitsValue[goalIndex],
            value: value.doubleOrZero
        )
    }

    private func setupSubscriptions() {
        calculationService.value
            .sink(receiveValue: { [weak self] value in self?.valueDidChanged(to: value) })
            .store(in: &subscriptions)

        calculationService.invert
            .sink(receiveValue: { [weak self] in self?.invert() })
            .store(in: &subscriptions)

        segmentService.currentSegment
            .sink(receiveValue: { [weak self] segment in self?.reloadSegmentData(segment) })
            .store(in: &subscriptions)

        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .sink(receiveValue: { [weak self] _ in self?.segmentService.saveToStorage() })
            .store(in: &subscriptions)
    }

    private func valueDidChanged(to newValue: String) {
        value = newValue
        recalculate()
    }

    private func invert() {
        guard let newInitialIndex = segment.initialUnits.firstIndex(of: segment.goalUnits[goalIndex]),
              let newGoalIndex = segment.goalUnits.firstIndex(of: segment.initialUnits[initialIndex])
        else { return }

        initialIndex = newInitialIndex
        goalIndex = newGoalIndex
        recalculate()
    }

    private func reloadSegmentData(_ segment: any UnitSegment) {
        updateSegmentUsage()
        self.segment = segment
        initialIndex = Constants.initialIndex
        goalIndex = Constants.goalIndex
        recalculate()
    }

    private func updateSegmentUsageIfValueChanged() {
        guard value != Constants.initialValue,
                value != Constants.initialValue + ButtonType.decimal.description else { return }
        updateSegmentUsage()
    }

    private func updateSegmentUsage() {
        segmentService.updateSegmentUsage(for: segment, with: value, convertedFrom: initialIndex, to: goalIndex)
    }
}
