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
            GeometryReader { geometry in
                HStack {
                    UnitsView(
                        unitData: segment.unitRowsdata,
                        activeIndex: $initialIndex,
                        value: $value,
                        visibleContentLength: geometry.size.height,
                        onChangeActiveIndex: { _ in recalculate() }
                    )
                    UnitsView(
                        unitData: segment.unitRowsdata,
                        activeIndex: $goalIndex,
                        value: $convertedValue,
                        visibleContentLength: geometry.size.height,
                        onChangeActiveIndex: { _ in recalculate() })
                }
            }
            ButtonPadView(value: $value, reverseAction: reverse)
        }
        .onChange(of: value, perform: { _ in recalculate() })
        .background(Color.pink.opacity(0.1))
    }

    private func onSegmentChange() {
        initialIndex = 0
        goalIndex = 1
        recalculate()
    }

    private func recalculate() {
        guard !value.isEmpty else {
            convertedValue = ""
            return
        }
        let goalNumber = converterService.convert(
            from: segment.units[initialIndex],
            to: segment.units[goalIndex],
            value: value.doubleOrZero
        )
        convertedValue = goalNumber
    }

    func reverse() {
        swap(&initialIndex, &goalIndex)
        recalculate()
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(segment: MassSegment())
    }
}
