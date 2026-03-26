//
//  ContentView.swift
//  CounterApp
//
//  Created by Prashant Pandey on 24/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter = 0
    @State var history = [Int]()
    
    var body: some View {
        Text(String(counter))
            .font(.system(size: 100))
            .padding()
        
        HStack {
            Spacer()
            
            CustomButton(title: "+", counter: $counter) {
                counter += 1
                history.append(counter)
            }
            
            Spacer()
            
            CustomButton(title: "-", counter: $counter) {
                counter -= 1
                history.append(counter)
            }
            Spacer()
        }.padding()
        
        HistoryView(history: history)
            .frame(width: 120,height: 240)
        
        Button("Reset") {
            counter = 0
            history = []
        }
    }
}

struct CustomButton: View {
    let title: String
    @Binding var counter: Int
    let action: () -> Void
    
    var body: some View {
        Button(title) {
            action()
        }.font(.system(size: 48))
    }
}

struct HistoryView: View {
    let history: [Int]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("History: Last 5")
                .font(.headline)
                .padding()
            
            ForEach(history.suffix(5), id: \.self) { value in
                Text("\(value)")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }.border(.gray)
    }
}


#Preview {
    ContentView()
}
