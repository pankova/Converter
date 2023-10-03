//
//  SegmentServiceImpl.swift
//  Converter
//
//  Created by Mariya Pankova on 03.10.2023.
//

final class SegmentServiceImpl: SegmentService {

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

    private(set) var currentSegment: any UnitSegment {
        get {
            allSegments[currentSegmentIndex]
        }
        set {
            allSegments[currentSegmentIndex] = newValue
        }
    }

    private let storage: SegmentStorage
    private var currentSegmentIndex: Int

    init(storage: SegmentStorage = UserDefaultsSegmentStorage()) {
        self.storage = storage
        self.currentSegmentIndex = 0
        retrieveSegments()
    }

    func updateSegmentUsage(with value: String, _ initialIndex: Int, _ goalIndex: Int) {
        currentSegment.value =  value
        currentSegment.moveToTheTopInitialUnit(with: initialIndex)
        currentSegment.moveToTheTopGoalUnit(with: goalIndex)
        storage.updateSegment(currentSegment)
    }

    func updateCurrentSegment(_ segment: any UnitSegment) {
        guard let index = allSegments.firstIndex(where: { $0.type == segment.type }) else { return }
        currentSegmentIndex = index
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
