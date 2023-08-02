//
//  DesignSystem.swift
//  Converter
//
//  Created by Mariya Pankova on 20.07.2023.
//

import Foundation
import SwiftUI

enum Padding {
    static let screen: CGFloat = 8
    static let inner: CGFloat = 12.0
}

extension Color {
    static let textPrimary = Color("TextPrimary")
    static let textSecondary = Color("TextSecondary")

    static let fillPrimary = Color("FillPrimary")
    static let fillSecondary = Color("FillSecondary")

    static let backgroundPrimary = Color("BackgroundPrimary")
    static let backgroundSecondary = Color("BackgroundSecondary")

    static let pressed = Color("Pressed")
}
