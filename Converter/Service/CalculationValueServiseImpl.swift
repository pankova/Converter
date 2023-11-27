//
//  CalculationValueServiceImpl.swift
//  Converter
//
//  Created by Mariya Pankova on 19.11.2023.
//

import Combine

final class CalculationValueServiceImpl: CalculationValueService {

    private(set) var value = CurrentValueSubject<String, Never>(Constants.initialValue)
    private(set) var invert = PassthroughSubject<Void, Never>()

    func update(with value: String) {
        self.value.send(value)
    }

    func invertUnits() {
        invert.send()
    }
}
