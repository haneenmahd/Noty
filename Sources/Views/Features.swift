//
//  Features.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct Features: View {
    let showDashboard: Binding<Bool>
    
    var body: some View {
        VStack {
            NYIllustration("Avatar")
                .padding()
            
            NYText("Write, Focus, Done", font: .title2)
                .padding()
            
            VStack(spacing: 30) {
                NYFeatureBrief(iconName: "staroflife", text: "Simple and clean UI.", iconColor: .lightGreen)
                
                NYFeatureBrief(iconName: "pencil.and.outline", text: "Don't forget things, write it down here.")
                
                NYFeatureBrief(iconName: "moon.circle", text: "Be kind to yourself. Write down your goals.", iconColor: .lightPink)
            }
            
            NYButton(text: "Next", theme: .secondary) {
                showDashboard.wrappedValue = true
            }
            .padding()
        }
    }
}

struct Features_Previews: PreviewProvider {
    static var previews: some View {
        Features(showDashboard: .constant(false))
    }
}
