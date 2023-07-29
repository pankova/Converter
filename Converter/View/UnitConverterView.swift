//
//  UnitConverterView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct UnitConverterView: View {
    @State var initialIndex: Int = 0
    @State var goalIndex: Int = 1
    @State var value: String = ""
    @State var convertedValue: String = ""
    @State var segment: any UnitSegment

    let converterService = ConverterService()
    
    var body: some View {
        VStack(spacing: 4) {
            SegmentView(segments: allSegments, selected: $segment)
            HStack {
                UnitsView(unitData: segment.unitRowsdata, activeIndex: $initialIndex, value: $value)
                UnitsView(unitData: segment.unitRowsdata, activeIndex: $goalIndex, value: $convertedValue)
            }
            ButtonPadView(value: $value, reverseAction: reverse)
        }
        .onChange(of: value, perform: convert)
        .background(Color.pink.opacity(0.1))
    }

    func convert(from value: String) {
        guard !value.isEmpty else {
            convertedValue = ""
            return
        }
        let valueNumber = Double(value) ?? 0.0
        let units = segment.units
        let initialUnit = units[initialIndex]
        let goalUnit = units[goalIndex]
        let goalNumber = converterService.convert(from: initialUnit, to: goalUnit, value: valueNumber)
        convertedValue = String(goalNumber)
    }

    func reverse() {
        swap(&initialIndex, &goalIndex)
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(segment: MassSegment())
    }
}
