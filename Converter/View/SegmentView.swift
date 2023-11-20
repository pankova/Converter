//
//  SegmentView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import Combine
import SwiftUI

struct SegmentView: View {

    @StateObject private var viewModel: SegmentViewModel
    
    private let generator = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(viewModel.segments, id: \.title) { segment in
                        ZStack {
                            Text(segment.title)
                                .padding(6)
                                .background(
                                    viewModel.selected.title == segment.title
                                    ? Color.accent1
                                    : Color.accent1Highlighted
                                )
                                .foregroundColor(.white)
                                .font(UIDevice.isIpad ? .header2 : .title2)
                                .cornerRadius(10)
                                .clipShape(ContainerRelativeShape())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 4)
                                )
                                .gesture(
                                    TapGesture()
                                        .onEnded{ _ in
                                            viewModel.selected = segment
                                            generator.impactOccurred()
                                            withAnimation {
                                                proxy.scrollTo(segment, anchor: .center)
                                            }
                                        }
                                )
                        }
                    }
                }
                .padding([.top, .leading, .trailing, .bottom], Padding.inner)
            }
        }
        .frame(height: UIDevice.isIpad ? 100 : 60)
    }

    init(viewModel: @autoclosure @escaping () -> SegmentViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(viewModel: .init(segmentService: AppContainer.shared.segmentService))
    }
}
