//
//  SegmentServiceImpl.swift
//  Converter
//
//  Created by Mariya Pankova on 03.10.2023.
//

import Combine
import Foundation

final class SegmentServiceImpl: SegmentService {

    private let storage: SegmentStorage

    private(set) var currentSegment: CurrentValueSubject<any UnitSegment, Never>

    private(set) var segments: [any UnitSegment]

    private var currentSegmentIndex: Int {
        didSet {
            currentSegment.send(segments[currentSegmentIndex])
        }
    }

    init(storage: SegmentStorage = UserDefaultsSegmentStorage(),
         currentSegmentIndex: Int = 0) {
        self.storage = storage
        self.segments = storage.segments
        self.currentSegmentIndex = currentSegmentIndex
        self.currentSegment = CurrentValueSubject(segments[currentSegmentIndex])
    }

    func changeCurrentSegment(to segment: any UnitSegment) {
        guard let index = segments.firstIndex(where: { $0.type == segment.type }) else { return }
        currentSegmentIndex = index
    }

    func updateSegmentUsage(for segment: any UnitSegment,
                            with value: String,
                            convertedFrom initialIndex: Int,
                            to goalIndex: Int) {
        guard let index = segments.firstIndex(where: { $0.type == segment.type }) else { return }
        segments[index].value = value
        segments[index].moveToTheTopInitialUnit(with: initialIndex)
        segments[index].moveToTheTopGoalUnit(with: goalIndex)
    }

    func saveToStorage() {
        storage.updateSegments(segments)
    }
}
