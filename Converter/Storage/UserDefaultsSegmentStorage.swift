//
//  UserDefaultsSegmentStorage.swift
//  Converter
//
//  Created by Mariya Pankova on 28.09.2023.
//

import Foundation

final class UserDefaultsSegmentStorage: SegmentStorage {

    private let userDefaults = UserDefaults.standard

    func retrieveSegment(_ segment: any UnitSegment) -> SegmentData? {
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

    func updateSegment(_ segment: any UnitSegment) {
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
}
