//
//  ContentView.swift
//  Bookworm
//
//  Created by Zuzana.Fernandes on 19/03/2025.
//

import SwiftUI

struct PushButton:View {
    let title: String
    // this is only changing the datat locally within the button so the text below ont chnage. theres only a one way connection. to make into two way, chnage state to binding
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white:0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0: 5)
    }
}
    
    // @binding allowing two views to share a value type state eg a boolean
struct LearnView: View {
        
        @State private var rememberMe = false
        var body: some View {
            VStack {
                PushButton(title: "Remember Me", isOn: $rememberMe)
                
                Text(rememberMe ? "On" : "Off")
            }
        }
    }

#Preview {
    LearnView()
}
