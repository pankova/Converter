//
//  UnitsView.swift
//  OnboardingAnimationOne
//
//  Created by Mariya Pankova on 18.07.2023.
//

import SwiftUI

struct UnitsView: View {

    @Binding var value: String
    @Binding var activeIndex: Int

    let unitData: UnitRowsData
    let itemSide: CGFloat
    let itemPadding: CGFloat
    let visibleContentLength: CGFloat
    private let generator = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                AdaptivePagingScrollView(
                    currentPageIndex: $activeIndex,
                    itemsAmount: unitData.units.count - 1,
                    itemScrollableSide: itemSide,
                    itemPadding: itemPadding,
                    visibleContentLength: visibleContentLength,
                    orientation: .vertical
                ) {
                    ForEach(unitData.units, id: \.self) { card in
                        let isSelectedCard = activeIndex == unitData.units.firstIndex(of: card) ?? 0
                        GeometryReader { screen in
                            UnitView(
                                itemSide: itemSide,
                                value: value,
                                unit: card.unit,
                                unitName: card.unitName,
                                isSelected: isSelectedCard
                            )
                            .scaleEffect(isSelectedCard ? 1 : 0.88)
                        }
                    }
                }
                .clipped()
                .onChange(of: activeIndex, perform: { index in
                    generator.impactOccurred()
                })
            }
        }

    }

    init(unitData: UnitRowsData,
         activeIndex: Binding<Int>,
         value: Binding<String>,
         itemSide: CGFloat = UIDevice.isIpad ? 120 : 80,
         itemPadding: CGFloat = 16,
         visibleContentLength: CGFloat = 300) {
        self.itemSide = itemSide
        self._activeIndex = activeIndex
        self._value = value
        self.itemPadding = itemPadding
        self.visibleContentLength = visibleContentLength
        self.unitData = unitData
    }
}

struct UnitsView_Previews: PreviewProvider {
    static var previews: some View {
        UnitsView(unitData: .init(units: []), activeIndex: .constant(0), value: .constant(""))
    }
}
