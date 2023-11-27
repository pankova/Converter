//
//  SegmentViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

import Combine
import SwiftUI

final class SegmentViewModel: ObservableObject {
    
    @Published var selected: any UnitSegment {
        didSet {
            segmentService.changeCurrentSegment(to: selected)
        }
    }

    var segments: [any UnitSegment] {
        segmentService.segments
    }

    private let segmentService: any SegmentService

    init(segmentService: any SegmentService) {
        self.selected = segmentService.currentSegment.value
        self.segmentService = segmentService
    }
}
