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

    private let calculationServise: CalculationServise
    private let segmentService: any SegmentService
    private var subscriptions = Set<AnyCancellable>()

    init(
        initialIndex: Int,
        goalIndex: Int,
        convertedValue: String,
        calculationServise: CalculationServise,
        segmentService: any SegmentService) {
            self.initialIndex = initialIndex
            self.goalIndex = goalIndex
            self.value = segmentService.currentSegment.value.value
            self.segment = segmentService.currentSegment.value
            self.convertedValue = convertedValue
            self.calculationServise = calculationServise
            self.segmentService = segmentService

            setupSubscriptions()
        }

    func recalculate() {
        guard value != Constants.initialValue else {
            convertedValue = Constants.initialValue
            return
        }
        convertedValue = convert()
    }

    func phaseDidChangeAction(for phase: ScenePhase) {
        if phase == .inactive {
            saveSegmentUsageIfValueChanged()
        }
    }

    private func setupSubscriptions() {
        calculationServise.value
            .sink(receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.valueDidChanged(from: self.value, to: value)
                self.recalculate()
            })
            .store(in: &subscriptions)

        calculationServise.invert
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }

                guard let newInitialIndex = segment.initialUnits.firstIndex(of: segment.goalUnits[self.goalIndex]),
                      let newGoalIndex = segment.goalUnits.firstIndex(of: segment.initialUnits[self.initialIndex]) 
                else { return }

                self.initialIndex = newInitialIndex
                self.goalIndex = newGoalIndex
                self.recalculate()
            })
            .store(in: &subscriptions)

        segmentService.currentSegment
            .sink(receiveValue: { [weak self] value in
                guard let self = self else { return }

                self.segment = value
                self.initialIndex = Constants.initialIndex
                self.goalIndex = Constants.goalIndex
                self.value = value.value
                self.recalculate()
            })
            .store(in: &subscriptions)
    }

    private func convert() -> String {
        ConverterService.convert(
            from: segment.initialUnitsValue[initialIndex],
            to: segment.goalUnitsValue[goalIndex],
            value: value.doubleOrZero
        )
    }

    private func saveSegmentUsageIfValueChanged() {
        guard value != Constants.initialValue else { return }
        saveSegmentUsage()
    }

    private func valueDidChanged(from: String, to: String) {
        if from != Constants.initialValue && to == Constants.initialValue {
            saveSegmentUsage()
        }
        self.value = to
    }

    private func saveSegmentUsage() {
        segmentService.saveSegmentUsage(with: value, convertedFrom: initialIndex, to: goalIndex)
    }

    private func invert() {
        guard let newInitialIndex = segment.initialUnits.firstIndex(of: segment.goalUnits[goalIndex]),
              let newGoalIndex = segment.goalUnits.firstIndex(of: segment.initialUnits[initialIndex])
        else { return }
        initialIndex = newInitialIndex
        goalIndex = newGoalIndex
        recalculate()
    }
}
