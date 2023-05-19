//
//  UpdateableSheetView.swift
//  ComebackAcademic
//
//  Created by Preoteasa Ioan-Silviu on 09.05.2023.
//

import SwiftUI

extension UpdateableSheetView {
    class ViewModel: ObservableObject {
        @Published var items: [String] = []
        private var timer = Timer()
        
        init() {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
                guard let self else { return }
                self.items.append(self.randomAlphanumericString(Int.random(in: 5...10)))
            })
        }
        
        func randomAlphanumericString(_ length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
            return randomString
        }
    }
}
struct UpdateableSheetView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10)
            RoundedRectangle(cornerRadius: 24)
                .frame(width: 30, height: 10)
                .foregroundColor(.gray)
                .opacity(0.5)
            
            Spacer()
                .frame(height: 10)
            
            List {
                ForEach($viewModel.items, id: \.self) { item in
                    Text("\(item.wrappedValue)")
                }
            }
        }
    }
}

struct UpdateableSheetView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateableSheetView()
    }
}
