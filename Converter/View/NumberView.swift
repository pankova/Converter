//
//  NumberView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import Combine
import SwiftUI

struct NumberView: View {

    @EnvironmentObject var appState: AppState

    let buttonType: ButtonType

    private let generator = UIImpactFeedbackGenerator(style: .soft)

    var body: some View {
        Button(buttonType.description) {
            generator.impactOccurred()
            appState.action.send(buttonType)
        }
        .buttonStyle(
            ButtonPadStyle(
                size: buttonSize(),
                foregroundColor: buttonType.foregroundColor,
                backgroundColor: buttonType.backgroundColor
            )
        )
    }

    init(buttonType: ButtonType) {
        self.buttonType = buttonType
    }

    private func buttonSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4.0
        let spacingCount = buttonCount + 1
        return (
            screenWidth
            - (spacingCount * Padding.inner)
            - Padding.screen * 2
        ) / buttonCount
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(buttonType: .invert)
    }
}
