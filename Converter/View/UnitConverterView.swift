//
//  UnitConverterView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct UnitConverterView: View {
    var body: some View {
        VStack {
            SegmentView()
            UnitsView()
            ButtonPadView()
        }
        .padding(Constants.padding)
        .background(Color.pink.opacity(0.1))
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView()
    }
}
