//
//  ViewFactory.swift
//  Converter
//
//  Created by Mariya Pankova on 15.11.2023.
//

struct ViewFactory {

    private static let container = AppContainer.shared

    private static var segmentService:  SegmentService  { container.segmentService }

    @MainActor
    static func segmentView() -> SegmentView {
        SegmentView(viewModel: SegmentViewModel(segmentService: segmentService))
    }

    @MainActor
    static func buttonPadView() -> ButtonPadView {
        ButtonPadView(viewModel: ButtonPadViewModel(segmentService: segmentService))
    }
}
