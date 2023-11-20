//
//  SegmentService.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

import Combine

protocol SegmentService {

    var currentSegment: CurrentValueSubject<any UnitSegment, Never> { get }
    var allSegments: [any UnitSegment] { get }

    func changeCurrentSegment(to segment: any UnitSegment)
    func saveSegmentUsage(with value: String, convertedFrom initialIndex: Int, to goalIndex: Int)
}
