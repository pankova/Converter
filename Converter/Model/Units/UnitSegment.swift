//
//  UnitSegment.swift
//  Converter
//
//  Created by Mariya Pankova on 25.07.2023.
//

import Foundation

protocol UnitSegment: Hashable {

    associatedtype UnitType: Dimension

    static var allUnits: [UnitType] { get }
    var keyedUnits: [Int: UnitType] { get }
    var initialUnits: [Int] { get set }
    var goalUnits: [Int] { get set }
    var type: SegmentType { get }
}

extension UnitSegment {

    var title: String { type.rawValue }

    var initialUnitsValue: [UnitType] {
        var units: [UnitType] = []
        initialUnits.forEach {
            guard let unit = keyedUnits[$0] else { return }
            units.append(unit)
        }
        return units
    }
    var goalUnitsValue: [UnitType] {
        var units: [UnitType] = []
        goalUnits.forEach {
            guard let unit = keyedUnits[$0] else { return }
            units.append(unit)
        }
        return units
    }

    var initialUnitRowsData: UnitRowsData {
        UnitRowsData(units: initialUnitsValue.map { UnitRow(unit: $0.symbol, unitName: $0.title) })
    }

    var goalUnitRowsData: UnitRowsData {
        UnitRowsData(units: goalUnitsValue.map { UnitRow(unit: $0.symbol, unitName: $0.title) })
    }

    mutating func moveToTheTopInitialUnit(with index: Int) {
        let unit = initialUnits.remove(at: index)
        initialUnits.insert(unit, at: initialUnits.startIndex)
    }

    mutating func moveToTheTopGoalUnit(with index: Int) {
        let unit = goalUnits.remove(at: index)
        goalUnits.insert(unit, at: goalUnits.startIndex)
    }
}
