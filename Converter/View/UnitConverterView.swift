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

    @Environment(\.scenePhase) private var scenePhase

    private var subscriptions = Set<AnyCancellable>()

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
                            value: viewModel.value,
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
            ButtonPadView()
                .padding([.top, .bottom], Padding.inner)
        }
        .background(Color.accent3Highlighted.opacity(0.4))
        .onAppear(perform: viewModel.recalculate)
        .onChange(of: scenePhase, perform: viewModel.phaseDidChangeAction)
        .onChange(of: viewModel.initialIndex) { _ in viewModel.recalculate() }
        .onChange(of: viewModel.goalIndex) { _ in viewModel.recalculate() }
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
                calculationServise: AppContainer.shared.calculationServise,
                segmentService: AppContainer.shared.segmentService
            )
        )
    }
}
