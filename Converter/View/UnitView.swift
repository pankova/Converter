//
//  UnitView.swift
//  OnboardingAnimationOne
//
//  Created by Mariya Pankova on 18.07.2023.
//

import SwiftUI

struct UnitView: View {

    let itemSide: CGFloat
    let value: String
    let unit: String
    let unitName: String
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .trailing) {
            if isSelected {
                HStack {
                    Text(value)
                        .font(.title1)
                    Text(unit)
                        .font(.title3)
                    Spacer()
                }
            }
            HStack {
                Text(unitName)
                    .font(isSelected ? .addition : .title3)
                if !isSelected {
                    Spacer()
                    Text(unit)
                        .font(.title3)
                        .foregroundColor(.gray.opacity(0.9))
                }
            }
        }
        .foregroundColor(.textSecondary)
        .minimumScaleFactor(0.1)
        .padding(12)
        .frame(height: itemSide)
        .background(Color.backgroundPrimary)
        .cornerRadius(16)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.33), radius: 3, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color.accent2 : Color.backgroundPrimary, lineWidth: isSelected ? 4 : 0)
        )
        .padding([.leading, .trailing], 4)
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(itemSide: 80, value: "5", unit: "Kilogram", unitName: "kg", isSelected: true)
    }
}
