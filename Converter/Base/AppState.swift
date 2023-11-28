//
//  AppState.swift
//  Converter
//
//  Created by Mariya Pankova on 27.11.2023.
//

import Combine

final class AppState: ObservableObject {
    @Published var value: String = ""

    var invert = PassthroughSubject<Void, Never>()
}
