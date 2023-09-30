//
//  SegmentService.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

// TODO: Protocol
final class SegmentService {

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
    }

    func moveToTheTopInitialUnit(with index: Int) {
        currentSegment.moveToTheTopInitialUnit(with: index)
    }

    func moveToTheTopGoalUnit(with index: Int) {
        currentSegment.moveToTheTopGoalUnit(with: index)
    }

    func updateCurrentSegment(_ segment: any UnitSegment) {
        guard let index = allSegments.firstIndex(where: { $0.type == segment.type }) else { return }
        currentSegmentIndex = index
    }

    func updateValue(_ value: String) {
        currentSegment.value =  value
    }
}
