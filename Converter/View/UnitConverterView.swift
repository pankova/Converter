//
//  UnitConverterView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct UnitConverterView: View {

    @Binding var segment: any UnitSegment

    let service = ConverterService()
    
    var body: some View {
        VStack(spacing: 4) {
            SegmentView(segments: allSegments, selected: segment)
            HStack {
                UnitsView(unitData: segment.unitRowsdata)
                UnitsView(unitData: segment.unitRowsdata)
            }
            ButtonPadView()
        }
        .background(Color.pink.opacity(0.1))
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(segment: .constant(MassSegment()))
    }
}
