//
//  SegmentService.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

// TODO: Protocol
final class SegmentService {
    var allSegments: [any UnitSegment] = [
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

    var currentSegmentIndex: Int

    var currentSegment: any UnitSegment {
        allSegments[currentSegmentIndex]
    }

    private let storage: SegmentStorage

    init(storage: SegmentStorage = UserDefaultsSegmentStorage()) {
        self.storage = storage
        self.currentSegmentIndex = 0
    }

    func moveToTheTopInitialUnit(with index: Int) {
        allSegments[currentSegmentIndex].moveToTheTopInitialUnit(with: index)
    }

    func moveToTheTopGoalUnit(with index: Int) {
        allSegments[currentSegmentIndex].moveToTheTopGoalUnit(with: index)
    }

    func updateCurrentSegment(_ segment: any UnitSegment) {
        guard let index = allSegments.firstIndex(where: { $0.type == segment.type }) else { return }
        currentSegmentIndex = index
    }

    func updateValue(_ value: String) {
        allSegments[currentSegmentIndex].value =  value
    }
}
