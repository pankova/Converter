//
//  UnitConverterView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct UnitConverterView: View {
    @State var initialIndex: Int
    @State var goalIndex: Int
    @State var value: String
    @State var convertedValue: String
    @State var segment: any UnitSegment

    @Environment(\.scenePhase) private var scenePhase

    let converterService: ConverterService
    let segmentService: SegmentService

    var body: some View {
        VStack(spacing: 0) {
            SegmentView(
                segmentService: segmentService,
                willChange: onSegmentWillChange,
                didChange: onSegmentDidChange,
                selected: $segment
            )
            .background(Color.accent3.opacity(0.6))
            Divider()
                .frame(height: 4)
                .overlay(.white)
            ZStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        UnitsView(
                            unitData: segment.initialUnitRowsData,
                            activeIndex: $initialIndex,
                            value: $value,
                            visibleContentLength: geometry.size.height,
                            onChangeActiveIndex: { _ in recalculate() }
                        )
                        UnitsView(
                            unitData: segment.goalUnitRowsData,
                            activeIndex: $goalIndex,
                            value: $convertedValue,
                            visibleContentLength: geometry.size.height,
                            onChangeActiveIndex: { _ in recalculate() }
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
            ButtonPadView(value: $value, reverseAction: reverse)
                .padding([.top, .bottom], Padding.inner)
        }
        .background(Color.accent3Highlighted.opacity(0.4))
        .onAppear() {
            recalculate()
        }
        .onChange(of: value, perform: { _ in recalculate() })
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveSegmentUsage()
            }
        }
    }

    init(converterService: ConverterService = ConverterService(),
         segmentService: SegmentService = SegmentServiceImpl(),
         initialIndex: Int = Constants.initialIndex,
         goalIndex: Int = Constants.goalIndex,
         convertedValue: String = Constants.initialValue
    ) {
        self.converterService = converterService
        self.segmentService = segmentService
        self._initialIndex = State(initialValue: initialIndex)
        self._goalIndex = State(initialValue: goalIndex)
        self._convertedValue = State(initialValue: convertedValue)
        self._segment = State(initialValue: segmentService.currentSegment)
        self._value = State(initialValue: segmentService.currentSegment.value)
    }

    private func onSegmentWillChange() {
        saveSegmentUsage()
    }

    private func saveSegmentUsage() {
        guard value != Constants.initialValue else { return }
        segmentService.updateSegmentUsage(with: value, initialIndex, goalIndex)
    }

    private func onSegmentDidChange() {
        segmentService.updateCurrentSegment(segment)
        initialIndex = Constants.initialIndex
        goalIndex = Constants.goalIndex
        value = segmentService.currentSegment.value
        recalculate()
    }

    private func recalculate() {
        guard value != Constants.initialValue else {
            convertedValue = Constants.initialValue
            return
        }
        let goalNumber = converterService.convert(
            from: segment.initialUnitsValue[initialIndex],
            to: segment.goalUnitsValue[goalIndex],
            value: value.doubleOrZero
        )
        convertedValue = goalNumber
    }

    func reverse() {
        guard let newInitialIndex = segment.initialUnits.firstIndex(of: segment.goalUnits[goalIndex]),
              let newGoalIndex = segment.goalUnits.firstIndex(of: segment.initialUnits[initialIndex]) else { return }
        initialIndex = newInitialIndex
        goalIndex = newGoalIndex
        recalculate()
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView()
    }
}
