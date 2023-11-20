//
//  AppContainer.swift
//  Converter
//
//  Created by Mariya Pankova on 15.11.2023.
//

final class AppContainer {

    static let shared = AppContainer()

    let calculationServise: CalculationServise = CalculationServiseImpl()

    let segmentService: SegmentService = SegmentServiceImpl()

    private init() { }
}
