//
//  ContentView.swift
//  GuessApp
//
//  Created by Robert Miller on 19.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var rightValue = Int.random(in: 1...100)
    @State var currentValue: Double = 0
    @State var opacity: Double = 0
    @State var showResult = false
    
    var body: some View {
        ZStack {
            Rectangle().ignoresSafeArea()
            VStack {
                MainTextView()
                NumberView(text: "\(rightValue)")
                SliderStack(rightValue: $rightValue,
                            currentValue: $currentValue,
                            opacity: $opacity)
                
                ButtonView(title: "Check me!",color: .green) {
                    showResult.toggle()
                } .alert(isPresented: $showResult) {
                    Alert(title: Text("You were close on \(computeScore())% !"),
                          message: Text("Your current value is \(lround(currentValue))"))
                }
                
                ButtonView(title: "Try again",
                           color: .orange,
                           action: reload)
                
                Spacer()
            }
        }
    }
}

extension ContentView {
    private func reload() {
        rightValue = Int.random(in: 1...100)
        opacity = Double(computeScore()) / 100
    }
    
    private func computeScore() -> Int {
        let difference = abs(rightValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

