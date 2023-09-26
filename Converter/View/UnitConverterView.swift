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
    @State var value: String = Constants.initialValue
    @State var convertedValue: String = Constants.initialValue
    @State var segment: any UnitSegment

    let converterService = ConverterService()
    
    var body: some View {
        VStack(spacing: 0) {
            SegmentView(segments: allSegments, onChange: onSegmentChange, selected: $segment)
                .background(Color.accent3.opacity(0.6))
            Divider()
                .frame(height: 4)
                .overlay(.white)
            ZStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
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
                            onChangeActiveIndex: { _ in recalculate() }
                        )
                    }
                }
                VStack {
                    Rectangle()
                        .frame(width: 8, height: 4)
                        .foregroundColor(Color.accent2)
                    Spacer().frame(height: 4)
                    Rectangle()
                        .frame(width: 8, height: 4)
                        .foregroundColor(Color.accent2)
                }
            }
            Divider()
                .frame(height: 4)
                .overlay(.white)
            ButtonPadView(value: $value, reverseAction: reverse)
                .padding([.top, .bottom], Padding.inner)
        }
        .onChange(of: value, perform: { _ in recalculate() })
        .background(Color.accent3Highlighted.opacity(0.4))
    }

    private func onSegmentChange() {
        initialIndex = 0
        goalIndex = 1
        recalculate()
    }

    private func recalculate() {
        guard value != Constants.initialValue else {
            convertedValue = Constants.initialValue
            return
        }
        let goalNumber = converterService.convert(
            from: segment.unitsValue()[initialIndex],
            to: segment.unitsValue() [goalIndex],
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
