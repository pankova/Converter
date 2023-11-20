//
//  SegmentServiceImpl.swift
//  Converter
//
//  Created by Mariya Pankova on 03.10.2023.
//

import Combine

final class SegmentServiceImpl: SegmentService {

    private let storage: SegmentStorage

    private(set) var currentSegment: CurrentValueSubject<any UnitSegment, Never>

    private(set) var allSegments: [any UnitSegment] = [
        MassSegment(),
        LengthSegment(),
        TemperatureSegment(),
        VolumeSegment(),
        AreaSegment(),
        SpeedSegment(),
        DurationSegment(),
        FuelEfficiencySegment(),
        StorageSegment(),
        EnergySegment(),
        AngleSegment(),
        PowerSegment(),
    ]

    private var currentSegmentIndex: Int {
        didSet {
            currentSegment.send(allSegments[currentSegmentIndex])
        }
    }

    init(
        storage: SegmentStorage = UserDefaultsSegmentStorage(),
        currentSegmentIndex: Int = 0
    ) {
        self.storage = storage
        self.currentSegmentIndex = currentSegmentIndex
        self.currentSegment = CurrentValueSubject(allSegments[currentSegmentIndex])
        retrieveSegments()
    }

    func changeCurrentSegment(to segment: any UnitSegment) {
        guard let index = allSegments.firstIndex(where: { $0.type == segment.type }) else { return }
        currentSegmentIndex = index
    }

    func saveSegmentUsage(with value: String, convertedFrom initialIndex: Int, to goalIndex: Int) {
        currentSegment.value.value = value
        currentSegment.value.moveToTheTopInitialUnit(with: initialIndex)
        currentSegment.value.moveToTheTopGoalUnit(with: goalIndex)
        storage.updateSegment(currentSegment.value)
    }

    private func retrieveSegments() {
        for i in 0..<allSegments.count {
            guard let userSegment = storage.retrieveSegment(allSegments[i]) else { continue }
            allSegments[i].value = userSegment.value
            allSegments[i].initialUnits = userSegment.initial
            allSegments[i].goalUnits = userSegment.goal
        }
    }
}
