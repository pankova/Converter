//
//  UnitSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 25.07.2023.
//

import Foundation

protocol UnitSegment: Hashable {
    associatedtype UnitType: Unit
    var units: [UnitType] { get }
    var title: String { get }
}

extension UnitSegment {
    var unitRowsdata: UnitRowsData {
        UnitRowsData(units: units.map { UnitRow(unit: $0.symbol, unitName: $0.title) })
    }
}
