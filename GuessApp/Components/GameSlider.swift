//
//  SwiftUIView.swift
//  GuessApp
//
//  Created by Robert Miller on 19.09.2021.
//

import SwiftUI

struct GameSlider: UIViewRepresentable {

    @Binding var opacity: Double
    @Binding var currentValue: Double
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .white
        slider.thumbTintColor = UIColor(red: 1,
                                        green: 0.6,
                                        blue: 0,
                                        alpha: CGFloat(opacity))
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.sliderMoved),
                         for: .valueChanged)
        
        return slider
        
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1,
                                        green: 0.6,
                                        blue: 0,
                                        alpha: CGFloat(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

extension GameSlider {
    class Coordinator: NSObject {
        var currentValue: Binding<Double>
        
        init(currentValue: Binding<Double>) {
            self.currentValue = currentValue
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            self.currentValue.wrappedValue = Double(sender.value)
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(opacity: .constant(0),
                   currentValue: .constant(0))
    }
}
