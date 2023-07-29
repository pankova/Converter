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
            SegmentView(segments: allSegments, onChange: onSegmentChange, selected: $segment)
            HStack {
                UnitsView(
                    unitData: segment.unitRowsdata,
                    activeIndex: $initialIndex,
                    value: $value,
                    onChangeActiveIndex: convert
                )
                UnitsView(
                    unitData: segment.unitRowsdata,
                    activeIndex: $goalIndex,
                    value: $convertedValue,
                    onChangeActiveIndex: convert)
            }
            ButtonPadView(value: $value, reverseAction: reverse)
        }
        .onChange(of: value, perform: convert)
        .background(Color.pink.opacity(0.1))
    }

    func onSegmentChange() {
        initialIndex = 0
        goalIndex = 1
    }

    func convert(_: Int) {
        convert(from: value)
    }

    func convert(from value: String) {
        guard !value.isEmpty else {
            convertedValue = ""
            return
        }
        let goalNumber = converterService.convert(
            from: segment.units[initialIndex],
            to: segment.units[goalIndex],
            value: value.doubleOrZero
        )

        let roundedGoal = Double(round(1000 * goalNumber) / 1000)
        if roundedGoal.truncatingRemainder(dividingBy: 10) == 0 {
            convertedValue = String(Int(roundedGoal))
        } else {
            convertedValue = String(roundedGoal)
        }
    }

    func reverse() {
        swap(&initialIndex, &goalIndex)
        convert(from: value)
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(segment: MassSegment())
    }
}
