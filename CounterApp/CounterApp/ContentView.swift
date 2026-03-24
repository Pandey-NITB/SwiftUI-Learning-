//
//  ContentView.swift
//  CounterApp
//
//  Created by Prashant Pandey on 24/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("0")
            .font(.system(size: 100))
            .padding()
        
        HStack {
            Spacer()
            Button("+") {
                
            }.font(.system(size: 48))
            Spacer()
            Button("-") {
                
            }.font(.system(size: 48))
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
