//
//  ButtonPadView.swift
//  Converter
//
//  Created by Mariya Pankova on 09.07.2023.
//

import SwiftUI

struct ButtonPadView: View {

    @EnvironmentObject var appState: AppState

    @StateObject private var viewModel: ButtonPadViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: Padding.inner) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Padding.inner) {
                    ForEach(row,  id: \.self) { buttonType in
                        NumberView(buttonType: buttonType)
                    }
                }
            }
        }
        .onFirstAppear {
            viewModel.state = appState
            viewModel.setupSubscriptions()
        }
    }

    init(viewModel: @autoclosure @escaping () -> ButtonPadViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
}

struct ButtonPadView_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.four)

    static var previews: some View {
        Button(buttonType.description) { }
            .buttonStyle(
                ButtonPadStyle(
                    size: 80,
                    foregroundColor: buttonType.foregroundColor,
                    backgroundColor: buttonType.backgroundColor
                )
            )
    }
}
