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
            UnitConverterView(segment: .constant(MassSegment()))
        }
    }
}
