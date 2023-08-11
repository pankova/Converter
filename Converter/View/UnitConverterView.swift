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
        VStack(spacing: 0) {
            SegmentView(segments: allSegments, onChange: onSegmentChange, selected: $segment)
                .background(Color.accent2)
            Spacer().frame(width: 374, height: 4).background(Color.white)
            GeometryReader { geometry in
                HStack(spacing: 4) {
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
                .padding([.leading, .trailing], Padding.screen)
            }
            .background(Color.accent3Highlighted)
            Spacer().frame(width: 375, height: 4).background(Color.white)
            ButtonPadView(value: $value, reverseAction: reverse)
                .padding([.top], Padding.inner)
        }
        .onChange(of: value, perform: { _ in recalculate() })
        .background(Color.accent3Highlighted.opacity(0.6))
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
