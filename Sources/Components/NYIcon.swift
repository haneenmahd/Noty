//
//  NYIcon.swift
//  Noty
//
//  Created by Haneen Mahdin on 20/04/22.
//

import SwiftUI

enum NYIconSize {
    case small, normal, medium, large
    
    func inSize() -> CGFloat {
        switch self {
        case .small:
            return 18
        case .medium:
            return 20
        case .large:
            return 30
        case .normal:
            return 24
        }
    }
}

enum NYIconColor {
    case normal, success, loading, inactive
    
//    other extra colors
    case violet, lightGreen, lightPink, blue, red
    
    func inColor() -> Color {
        switch self {
        case .normal:
            return NYPalette.textSecondary
        case .success:
            return NYPalette.success
        case .loading:
            return NYPalette.accentBackground
        case .inactive:
            return NYPalette.inactive
        case .violet:
            return NYPalette.violet
        case .lightGreen:
            return NYPalette.lightGreen
        case .lightPink:
            return NYPalette.lightPink
        case .blue:
            return NYPalette.blue
        case .red:
            return NYPalette.red
        }
    }
}

enum NYIconWeight {
    case bold, semibold, regular, light
    
    func inFont() -> Font.Weight {
        switch self {
        case .bold:
            return .bold
        case .semibold:
            return .semibold
        case .regular:
            return .regular
        case .light:
            return .light
        }
    }
}

struct NYIcon: View {
    let iconName: String
    let iconSize: NYIconSize
    let iconColor: NYIconColor
    let iconWeight: NYIconWeight
    
    init(iconName: String, iconSize: NYIconSize = .normal, iconColor: NYIconColor = .normal, iconWeight: NYIconWeight = .semibold) {
        self.iconName = iconName
        self.iconSize = iconSize
        self.iconColor = iconColor
        self.iconWeight = iconWeight
    }
    
    var body: some View {
        Image(systemName: iconName)
            .font(.system(size: iconSize.inSize()).weight(iconWeight.inFont()))
            .foregroundColor(iconColor.inColor())
            .padding(2)
    }
}

struct NYIcon_Previews: PreviewProvider {
    static var previews: some View {
        NYIcon(iconName: "person.circle", iconColor: .inactive)
    }
}
