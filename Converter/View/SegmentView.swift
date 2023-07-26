//
//  SegmentView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct SegmentView: View {
    var segments: [any UnitSegment]
    @State var selected: any UnitSegment

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(segments, id: \.title) { segment in
                        ZStack {
                            Text(segment.title)
                                .padding(6)
                                .background(selected.title == segment.title ? .green : .white)
                                .cornerRadius(8)
                                .clipShape(ContainerRelativeShape())
                                .gesture(
                                    TapGesture()
                                        .onEnded{ gesture in
                                            selected = segment
                                            withAnimation {
                                                proxy.scrollTo(segment, anchor: .center)
                                            }
                                        }
                                )
                        }
                    }
                }
                .padding(Padding.inner)
            }
            .background(.gray)
        }
        .frame(height: 60)
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segments: [allSegments], selected: MassSegment())
    }
}
