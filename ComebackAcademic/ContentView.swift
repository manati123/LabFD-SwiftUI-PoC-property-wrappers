//
//  ContentView.swift
//  ComebackAcademic
//
//  Created by Preoteasa Ioan-Silviu on 09.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showUpdateableSheet: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    ColorPickerView()
                } label: {
                    Text("Go to color picker")
                        .font(.custom("Calibri", size: 32))
                        .foregroundColor(.black)
                }
                
                Button {
                    showUpdateableSheet = true
                } label: {
                    Text("Open updateable sheet")
                        .font(.custom("Calibri", size: 32))
                        .foregroundColor(.black)
                }
            }
        }
        .sheet(isPresented: $showUpdateableSheet, content: {
            UpdateableSheetView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
