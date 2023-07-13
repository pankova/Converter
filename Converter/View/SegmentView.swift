//
//  SegmentView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

enum Segment: String, CaseIterable {
    case weight, length, temperature, currency, distance, area
}

struct SegmentView: View {
    var segments: [Segment]
    @State var selected: Segment

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(segments, id: \.self) { segment in
                        ZStack {
                            Text(segment.rawValue.capitalized)
                                .id(segment)
                                .padding(6)
                                .background(selected == segment ? .green : .white)
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
                .padding(Constants.padding)
            }
            .background(.gray)
        }
        .frame(height: 60)
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segments: Segment.allCases, selected: .weight)
    }
}
