//
//  SliderStack.swift
//  GuessApp
//
//  Created by Robert Miller on 19.09.2021.
//

import SwiftUI

struct SliderStack: View {
    @Binding var rightValue: Int
    @Binding var currentValue: Double
    @Binding var opacity: Double
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.white)
                .padding()
            
            GameSlider(opacity: $opacity,
                       currentValue: $currentValue)
                .onChange(of: currentValue) {
                    _ in opacity = changeOpacity()
                }
            
            Text("100")
                .foregroundColor(.white)
                .padding()
        }
        .padding()
    }
}

extension SliderStack {
    
    private func changeOpacity() -> Double {
        let opacityValue =  Double(computeScore()) / 100
        return opacityValue < 0.3 ? 0 : opacityValue
    }
    
    private func computeScore() -> Int {
        let difference = abs(rightValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct SliderStack_Previews: PreviewProvider {
    static var previews: some View {
        SliderStack(rightValue: .constant(0),
                    currentValue: .constant(0),
                    opacity: .constant(0))
    }
}
