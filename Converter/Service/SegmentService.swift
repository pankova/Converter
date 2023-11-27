//
//  SegmentService.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Combine

protocol SegmentService {

    var currentSegment: CurrentValueSubject<any UnitSegment, Never> { get }
    var segments: [any UnitSegment] { get }

    func changeCurrentSegment(to segment: any UnitSegment)
    func updateSegmentUsage(
        for segment: any UnitSegment,
        with value: String,
        convertedFrom initialIndex: Int,
        to goalIndex: Int)
    func saveToStorage()
}
