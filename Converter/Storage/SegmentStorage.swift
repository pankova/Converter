//
//  SegmentStorage.swift
//  Converter
//
//  Created by Mariya Pankova on 28.09.2023.
//

protocol SegmentStorage {

    var segments: [any UnitSegment] { get }

    func updateSegments(_ segments: [any UnitSegment])
}
