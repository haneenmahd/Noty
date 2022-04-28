//
//  GetStarted.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct GetStarted: View {
    let showDashboard: Binding<Bool>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30) {
                NYIllustration("NoteIllustration")
                
                VStack(alignment: .center, spacing: 15) {
                    NYText("Note Taking made easy!", font: .title2)
                        .multilineTextAlignment(.center)
                    
                    NYText("Write down your tasks, set timers, focus on your goal without distraction", font: .description)
                        .multilineTextAlignment(.center)
                }
                
                NavigationLink("Get Started", destination: Features(showDashboard: showDashboard))
                    .font(.system(size: 20).weight(.bold))
                    .padding()
                    .frame(maxWidth: 318)
                    .background(NYPalette.secondaryAccent)
                    .foregroundColor(NYPalette.white)
                    .cornerRadius(5)
            }
            .padding()
            .animation(.spring(), value: showDashboard.wrappedValue)
        }
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted(showDashboard: .constant(true))
    }
}
