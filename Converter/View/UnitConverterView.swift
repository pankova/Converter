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
//    @State var value: Double
    @State var segment: any UnitSegment

    let service = ConverterService()
    
    var body: some View {
        VStack(spacing: 4) {
            SegmentView(segments: allSegments, selected: $segment)
            HStack {
                UnitsView(unitData: segment.unitRowsdata, activeIndex: $initialIndex)
                UnitsView(unitData: segment.unitRowsdata, activeIndex: $goalIndex)
            }
            ButtonPadView()
        }
        .background(Color.pink.opacity(0.1))
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(segment: MassSegment())
    }
}
