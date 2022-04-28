//
//  NYText.swift
//  Noty
//
//  Created by Haneen Mahdin on 20/04/22.
//

import SwiftUI

enum NYTextFont {
    case title, title2, title3, description, subheadline, navigationTitle
}

struct NYTextModifier: ViewModifier {
    let font: NYTextFont
    
    func body(content: Content) -> some View {
        switch font {
        case .title:
            return content
                .font(.system(size: 40).weight(.semibold))
                .foregroundColor(NYPalette.textPrimary)
        case .title2:
                return content
                .font(.system(size: 30).weight(.semibold))
                .foregroundColor(NYPalette.textPrimary)
        case .title3:
            return content
                .font(.system(size: 20).weight(.semibold))
                .foregroundColor(NYPalette.textSecondary)
        case .subheadline:
            return content
                .font(.system(size: 18).weight(.semibold))
                .foregroundColor(NYPalette.textPrimary)
        case .description:
            return content
                .font(.system(size: 20).weight(.regular))
                .foregroundColor(NYPalette.textSecondary)
        case .navigationTitle:
            return content
                .font(.system(size: 24).weight(.bold))
                .foregroundColor(NYPalette.textPrimary)
                
        }
    }
}

extension Text {
    func applyStyle(font: NYTextFont) -> some View {
        modifier(NYTextModifier(font: font))
    }
}

struct NYText: View {
    let text: String
    let font: NYTextFont
    
    init(_ text: String, font: NYTextFont = .subheadline) {
        self.text = text
        self.font = font
    }
    
    var body: some View {
        Text(text)
            .applyStyle(font: font)
            
    }
}

struct NYText_Previews: PreviewProvider {
    static var previews: some View {
        NYText("Hello World", font: .title)
    }
}
