//
//  ButtonPadViewModel.swift
//  Converter
//
//  Created by Mariya Pankova on 14.11.2023.
//

final class ButtonPadViewModel {

    let buttonTypes: [[ButtonType]] = {
        [
            [.digit(.seven), .digit(.eight), .digit(.nine), .clearSymbol],
            [.digit(.four), .digit(.five), .digit(.six), .invert],
            [.digit(.one), .digit(.two), .digit(.three), .plusMinus],
            [.clearAll, .digit(.zero), .decimal]
        ]
    }()
}