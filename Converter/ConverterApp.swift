//
//  ConverterApp.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

@main
struct ConverterApp: App {

    var body: some Scene {
        WindowGroup {
            UnitConverterView(
                viewModel: UnitConverterViewModel(
                    initialIndex: Constants.initialIndex,
                    goalIndex: Constants.goalIndex,
                    convertedValue: Constants.initialValue, 
                    calculationService: AppContainer.shared.calculationService,
                    segmentService: AppContainer.shared.segmentService
                )
            )
        }
    }
}
