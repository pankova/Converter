//
//  UnselectedUnitView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct UnselectedUnitView: View {
    var unit: String
    var unitName: String

    var body: some View {
        HStack {
            Text(unitName.capitalized)
            Spacer()
            Text(unit)
        }
        .font(.system(size: 16, weight: .light))
    }
}

struct UnselectedUnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnselectedUnitView(unit: "km", unitName: "kilometer")
    }
}
