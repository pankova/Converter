//
//  ButtonPadView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct ButtonPadView: View {

    var buttonTypes: [[ButtonType]] {
        [
            [.digit(.seven), .digit(.eight), .digit(.nine), .clearSymbol],
            [.digit(.four), .digit(.five), .digit(.six), .reverse],
            [.digit(.one), .digit(.two), .digit(.three),],
            [.clearAll, .digit(.zero), .decimal]
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Padding.inner) {
            ForEach(buttonTypes, id: \.self) { row in
                HStack(spacing: Padding.inner) {
                    ForEach(row,  id: \.self) { buttonType in
                        NumberView(buttonType: buttonType)
                    }
                }
            }
        }
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
