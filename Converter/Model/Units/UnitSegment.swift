//
//  UnitSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 25.07.2023.
//

import Foundation

protocol UnitSegment: Hashable {
    associatedtype UnitType: Dimension
    var units: [UnitType] { get set }
    var title: String { get }
}

extension UnitSegment {
    var unitRowsdata: UnitRowsData {
        UnitRowsData(units: units.map { UnitRow(unit: $0.symbol, unitName: $0.title) })
    }

    func unitsValue() -> [UnitType] { units }

    mutating func moveToTheTopUnit(with index: Int) {
        let unit = units.remove(at: index)
        units.insert(unit, at: units.startIndex)
    }
}
