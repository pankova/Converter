//
//  SegmentStorage.swift
//  Converter
//
//  Created by Mariya Pankova on 28.09.2023.
//

protocol SegmentStorage {

    func retrieveSegment(_ segment: any UnitSegment) -> SegmentData?
    func updateSegment(_ segment: any UnitSegment)
}
