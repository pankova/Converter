//
//  ButtonPadView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct ButtonPadView: View {
    @Binding var value: String
    var invertAction: VoidBlock?

    var buttonTypes: [[ButtonType]] {
        [
            [.digit(.seven), .digit(.eight), .digit(.nine), .clearSymbol],
            [.digit(.four), .digit(.five), .digit(.six), .invert],
            [.digit(.one), .digit(.two), .digit(.three), .plusMinus],
            [.clearAll, .digit(.zero), .decimal]
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Padding.inner) {
            ForEach(buttonTypes, id: \.self) { row in
                HStack(spacing: Padding.inner) {
                    ForEach(row,  id: \.self) { buttonType in
                        NumberView(
                            buttonType: buttonType,
                            action: action(for: buttonType)
                        )
                    }
                }
            }
        }
    }

    func action(for buttonType: ButtonType) -> VoidBlock {
        switch buttonType {
        case .clearSymbol:
            return clearSymbol
        case .clearAll:
            return clear
        case .invert:
            return invert
        case .plusMinus:
            return changeSign
        default:
            return { addDigit(buttonType) }
        }
    }

    func addDigit(_ buttonType: ButtonType) {
        if buttonType == .decimal && value.contains(buttonType.description) {
            return
        }
        if buttonType != .decimal && value == Constants.initialValue {
            value = ""
        }
        value += buttonType.description
    }

    func changeSign() {
        guard let numberValue = Double(value),
              numberValue != 0 else { return }
        value = NumberFormatter.outputFormatter.string(from: -numberValue)
    }

    func invert() {
        invertAction?()
    }

    func clearSymbol() {
        value.count == 1 ? clear() : { value.removeLast() }()
    }

    func clear() {
        value = Constants.initialValue
    }
}

struct ButtonPadView_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.four)

    static var previews: some View {
        Button(buttonType.description) { }
            .buttonStyle(
                ButtonPadStyle(
                    size: 80,
                    foregroundColor: buttonType.foregroundColor,
                    backgroundColor: buttonType.backgroundColor
                )
            )
    }
}
