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

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.header)
            .frame(width: size, height: 0.8 * size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color.pressed
                }
            }
            .clipShape(Capsule())
    }
}
