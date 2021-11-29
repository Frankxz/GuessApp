//
//  NumberView.swift
//  GuessApp
//
//  Created by Robert Miller on 19.09.2021.
//

import SwiftUI

struct NumberView: View {
    var text = ""
        var body: some View {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                Text("\(text)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView()
    }
}
