//
//  ButtonPadStyle.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct ButtonPadStyle: ButtonStyle {

    var size: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    private let cornerRadius: CGFloat = 26

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(UIDevice.isIpad ? .header1 : .header2)
            .frame(width: size, height: (UIDevice.isIpad ? 0.5 : 0.8) * size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color.pressed
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white, lineWidth: 4)
            )
    }
}
