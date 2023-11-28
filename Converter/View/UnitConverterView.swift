//
//  UnitConverterView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import Combine
import SwiftUI

struct UnitConverterView: View {

    @StateObject private var viewModel: UnitConverterViewModel
    @StateObject var appState = AppState()

    var body: some View {
        VStack(spacing: 0) {
            ViewFactory.segmentView()
                .background(Color.accent3.opacity(0.6))
            Divider()
                .frame(height: 4)
                .overlay(.white)
            ZStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        UnitsView(
                            unitData: viewModel.segment.initialUnitRowsData,
                            activeIndex: $viewModel.initialIndex,
                            value: appState.value,
                            visibleContentLength: geometry.size.height
                        )
                        UnitsView(
                            unitData: viewModel.segment.goalUnitRowsData,
                            activeIndex: $viewModel.goalIndex,
                            value: viewModel.convertedValue,
                            visibleContentLength: geometry.size.height
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
            ViewFactory.buttonPadView()
                .padding([.top, .bottom], Padding.inner)
        }
        .environmentObject(appState)
        .background(Color.accent3Highlighted.opacity(0.4))
        .onFirstAppear {
            viewModel.state = appState
            viewModel.setupSubscriptions()
        }
    }

    init(viewModel: @autoclosure @escaping () -> UnitConverterViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView(
            viewModel: .init(
                initialIndex: 0,
                goalIndex: 0,
                convertedValue: "",
                segmentService: AppContainer.shared.segmentService
            )
        )
    }
}
