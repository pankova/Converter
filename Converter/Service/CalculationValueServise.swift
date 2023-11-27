//
//  CalculationValueService.swift
//  Converter
//
//  Created by Mariya Pankova on 19.11.2023.
//

import Combine

protocol CalculationValueService {

    var value: CurrentValueSubject<String, Never> { get }
    var invert: PassthroughSubject<Void, Never> { get }

    func update(with value: String)
    func invertUnits()
}
