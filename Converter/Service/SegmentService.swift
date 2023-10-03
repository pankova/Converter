//
//  SegmentService.swift
//  Converter
//
//  Created by Mariya Pankova on 26.07.2023.
//

protocol SegmentService {

    var allSegments: [any UnitSegment] { get }
    var currentSegment: any UnitSegment { get }

    func updateSegmentUsage(with value: String, _ initialIndex: Int, _ goalIndex: Int)
    func updateCurrentSegment(_ segment: any UnitSegment)
}
