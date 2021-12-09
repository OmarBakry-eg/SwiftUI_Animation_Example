//
//  ContentView.swift
//  Hello Swiftui animation text
//
//  Created by Omar Bakry on 09/12/2021.
//

import SwiftUI

struct ContentView: View {
    let letters : Array = Array("Hello , SwiftUI")
    @State private var enabled : Bool = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRect : Bool = false

    var body: some View {
        VStack {
            HStack(spacing : 0){
                ForEach(0..<letters.count){
                    num in Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .red : .blue)
                        .offset(dragAmount) // moving item around x , y screen coordinate
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
                            
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({val in dragAmount = val.translation})
                    .onEnded{_ in dragAmount = .zero
                        enabled.toggle()
                    }
                
        )
            
            Spacer().frame(height:30)
            
            Button("Tap Me"){
                withAnimation{
                    isShowingRect.toggle()
                }
            }
            
            if isShowingRect {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
