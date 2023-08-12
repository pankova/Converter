//
//  SegmentView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct SegmentView: View {
    var segments: [any UnitSegment]
    var onChange: VoidBlock
    @Binding var selected: any UnitSegment
    private let generator = UIImpactFeedbackGenerator(style: .light)

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(segments, id: \.title) { segment in
                        ZStack {
                            Text(segment.title)
                                .padding(6)
                                .background(
                                    selected.title == segment.title
                                    ? Color.accent1
                                    : Color.accent1Highlighted
                                )
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                                .cornerRadius(10)
                                .clipShape(ContainerRelativeShape())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 4)
                                )
                                .gesture(
                                    TapGesture()
                                        .onEnded{ gesture in
                                            selected = segment
                                            generator.impactOccurred()
                                            onChange()
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
        .frame(height: 60)
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segments: allSegments, onChange: { }, selected: .constant(MassSegment()))
    }
}
