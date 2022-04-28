//
//  FeatureBrief.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct NYFeatureBrief: View {
    let iconName: String
    let text: String
    let iconColor: NYIconColor
    
    init(iconName: String, text: String, iconColor: NYIconColor = .violet) {
        self.iconName = iconName
        self.text = text
        self.iconColor = iconColor
    }
    
    var body: some View {
        HStack(spacing: 20) {
            NYIcon(iconName: iconName, iconSize: .large, iconColor: iconColor, iconWeight: .semibold)
            
            NYText(text, font: .description)
            
            Spacer()
        }
        .padding(.leading, 20)
    }
}

struct NYFeatureBrief_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            NYFeatureBrief(iconName: "pencil.and.outline", text: "You don’t have to worry about forgetting things. Just write it down here.")
            
            NYFeatureBrief(iconName: "timer", text: "Set timers so that you can adjust the time between your life, work and goals.", iconColor: .lightGreen)
            
            NYFeatureBrief(iconName: "moon.circle", text: "You don’t have to worry about forgetting things. Just write it down here.", iconColor: .lightPink)
        }
    }
}
