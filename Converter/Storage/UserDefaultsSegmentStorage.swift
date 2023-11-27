//
//  UserDefaultsSegmentStorage.swift
//  Converter
//
//  Created by Mariya Pankova on 28.09.2023.
//

import Foundation

final class UserDefaultsSegmentStorage: SegmentStorage {

    private let userDefaults = UserDefaults.standard

    private(set) var segments: [any UnitSegment] = [
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

    init() {
        retrieveSegments()
    }

    func updateSegments(_ segments: [any UnitSegment]) {
        for segment in segments {
            updateSegment(segment)
        }
    }

    private func updateSegment(_ segment: any UnitSegment) {
        let segmentData = SegmentData(
            value: segment.value,
            initial: segment.initialUnits,
            goal: segment.goalUnits
        )
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(segmentData)
            userDefaults.set(data, forKey: segment.type.rawValue)
        } catch {
            print("Unable to Encode Segment (\(error))")
            assertionFailure()
        }
    }

    private func retrieveSegments() {
        for i in 0..<segments.count {
            guard let userSegment = retrieveSegment(segments[i]) else { continue }
            segments[i].value = userSegment.value
            segments[i].initialUnits = userSegment.initial
            segments[i].goalUnits = userSegment.goal
        }
    }

    private func retrieveSegment(_ segment: any UnitSegment) -> SegmentData? {
        guard let data = UserDefaults.standard.data(forKey: segment.type.rawValue) else { return nil }

        do {
            let decoder = JSONDecoder()
            let segmentData = try decoder.decode(SegmentData.self, from: data)
            return segmentData
        } catch {
            print("Unable to Decode Segment (\(error))")
            assertionFailure()
            return nil
        }
    }
}
