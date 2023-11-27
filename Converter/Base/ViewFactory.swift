//
//  ViewFactory.swift
//  Converter
//
//  Created by Mariya Pankova on 15.11.2023.
//

struct ViewFactory {

    private static let container = AppContainer.shared

    private static var calculationService: CalculationValueService { container.calculationService }
    private static var segmentService:  SegmentService  { container.segmentService }

    static func segmentView() -> SegmentView {
        SegmentView(viewModel: SegmentViewModel(segmentService: segmentService))
    }

    static func numberView(with buttonType: ButtonType) -> NumberView {
        NumberView(
            viewModel: NumberViewModel(
                calculationService: calculationService,
                segmentService: segmentService
            ),
            buttonType: buttonType
        )
    }
}
