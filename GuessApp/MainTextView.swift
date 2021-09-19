//
//  MainTextView.swift
//  GuessApp
//
//  Created by Robert Miller on 19.09.2021.
//

import SwiftUI

struct MainTextView: View {
    var body: some View {
        Text("Move the slider as close as possible to number")
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct MainTextView_Previews: PreviewProvider {
    static var previews: some View {
        MainTextView()
    }
}
