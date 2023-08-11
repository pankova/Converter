//
//  DurationSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 11.08.2023.
//

import Foundation

struct DurationSegment: UnitSegment {
    let units: [UnitDuration] = [
        .hours,
        .minutes,
        .seconds,
        .milliseconds,
        .microseconds,
        .nanoseconds,
        .picoseconds
    ]
    let title = "Duration"
}
