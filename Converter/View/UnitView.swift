//
//  UnitView.swift
//  OnboardingAnimationOne
//
//  Created by Mariya Pankova on 18.07.2023.
//

import SwiftUI

struct UnitView: View {
    let itemSide: CGFloat
    var value: String
    var unit: String
    var unitName: String

    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(value)
                    .font(.title1)
                Text(unit)
                    .font(.title2)
                Spacer()
            }
            Text(unitName)
                .font(.addition)
        }
        .foregroundColor(.textSecondary)
        .minimumScaleFactor(0.1)
        .padding(12)
        .frame(height: itemSide)
        .background(Color.backgroundPrimary)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(itemSide: 80, value: "5", unit: "Kilogram", unitName: "kg")
    }
}
