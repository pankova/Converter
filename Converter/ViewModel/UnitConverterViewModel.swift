//
//  UnitConverterViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

@MainActor
final class UnitConverterViewModel: ObservableObject {

    var state: AppState!

    @Published var initialIndex: Int
    @Published var goalIndex: Int

    @Published private(set) var convertedValue: String
    @Published private(set) var segment: any UnitSegment

    private let segmentService: any SegmentService
    private var subscriptions = Set<AnyCancellable>()

    init(
        initialIndex: Int,
        goalIndex: Int,
        convertedValue: String,
        segmentService: any SegmentService) {
            self.initialIndex = initialIndex
            self.goalIndex = goalIndex
            self.segment = segmentService.currentSegment.value
            self.convertedValue = convertedValue
            self.segmentService = segmentService
        }

    func recalculate() {
        guard state.value != Constants.initialValue else {
            convertedValue = Constants.initialValue
            return
        }

        convertedValue = ConverterService.convert(
            from: segment.initialUnitsValue[initialIndex],
            to: segment.goalUnitsValue[goalIndex],
            value: state.value.doubleOrZero
        )
    }

    func setupSubscriptions() {
        state.$value
            .sink(receiveValue: { [weak self] _ in self?.recalculate() })
            .store(in: &subscriptions)

        state.invert
            .sink(receiveValue: { [weak self] in self?.invert() })
            .store(in: &subscriptions)

        segmentService.currentSegment
            .sink(receiveValue: { [weak self] segment in self?.reloadSegmentData(segment) })
            .store(in: &subscriptions)

        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .sink(receiveValue: { [weak self] _ in self?.segmentService.saveToStorage() })
            .store(in: &subscriptions)
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
        guard state.value != Constants.initialValue,
              state.value != Constants.initialValue + ButtonType.decimal.description else { return }
        updateSegmentUsage()
    }

    private func updateSegmentUsage() {
        segmentService.updateSegmentUsage(for: segment, with: state.value, convertedFrom: initialIndex, to: goalIndex)
    }
}
