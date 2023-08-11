//
//  StorageSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct StorageSegment: UnitSegment {
    let units: [UnitInformationStorage] = [
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
    let title = "Storage"
}
