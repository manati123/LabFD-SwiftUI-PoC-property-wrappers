//
//  ColorPickerView.swift
//  ComebackAcademic
//
//  Created by Preoteasa Ioan-Silviu on 09.05.2023.
//

import SwiftUI

extension ColorPickerView {
    class ViewModel: ObservableObject {
        @Published var color: Color = .red
        @Published var opacity: Double = 1.0
    }
}

struct ColorPickerView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    dismiss()
                } label: {
                    Text("Go Back")
                }
            }
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .frame(width:400)
                    .foregroundColor(viewModel.color)
                    .opacity(viewModel.opacity)
                Spacer()
            }
            ColorPicker("Pick a color", selection: $viewModel.color)
            Slider(value: $viewModel.opacity)
        }.navigationBarHidden(true)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
