//
//  SelectedUnitView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct SelectedUnitView: View {
    var value: Int
    var unit: String
    var unitName: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .bold()
                .font(.system(size: 24))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
            HStack {
                Text(unitName.capitalized)
                Spacer()
                Text(unit)
            }
            .font(.system(size: 16, weight: .light))
        }
    }
}

struct SelectedUnitView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedUnitView(value: 533333333, unit: "km", unitName: "kilometer")
    }
}
