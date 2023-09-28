//
//  SegmentView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct SegmentView: View {
    let segmentService: SegmentService

    var willChange: VoidBlock
    var didChange: VoidBlock
    @Binding var selected: any UnitSegment

    private let generator = UIImpactFeedbackGenerator(style: .light)

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(segmentService.allSegments, id: \.title) { segment in
                        ZStack {
                            Text(segment.title)
                                .padding(6)
                                .background(
                                    selected.title == segment.title
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
                                        .onEnded{ gesture in
                                            willChange()
                                            selected = segment
                                            segmentService.updateCurrentSegment(segment)
                                            generator.impactOccurred()
                                            didChange()
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
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segmentService: SegmentService(), willChange: { }, didChange: { }, selected: .constant(MassSegment()))
    }
}
