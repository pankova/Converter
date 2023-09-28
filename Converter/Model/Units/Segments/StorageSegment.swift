//
//  StorageSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct StorageSegment: UnitSegment {
    static let allUnits: [UnitInformationStorage] = [
        .bytes,
        .bits,
        .nibbles,

        .yottabytes,
        .zettabytes,
        .exabytes,
        .petabytes,
        .terabytes,
        .gigabytes,
        .megabytes,
        .kilobytes,

        .yottabits,
        .zettabits,
        .exabits,
        .petabits,
        .terabits,
        .gigabits,
        .megabits,
        .kilobits,

        .yobibytes,
        .zebibytes,
        .exbibytes,
        .pebibytes,
        .tebibytes,
        .gibibytes,
        .mebibytes,
        .kibibytes,

        .yobibits,
        .zebibits,
        .exbibits,
        .pebibits,
        .tebibits,
        .gibibits,
        .mebibits,
        .kibibits
    ]

    let type = SegmentType.storage
    let keyedUnits: [Int: UnitInformationStorage]

    var initialUnits: [Int]
    var goalUnits: [Int]

    init () {
        self.initialUnits = Array(0..<Self.allUnits.count)
        self.goalUnits = Array(0..<Self.allUnits.count)
        self.keyedUnits = Dictionary(uniqueKeysWithValues: zip(0..<Self.allUnits.count, Self.allUnits))
    }

}
