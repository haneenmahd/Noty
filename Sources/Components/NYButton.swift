//
//  NYButton.swift
//  Noty
//
//  Created by Haneen Mahdin on 20/04/22.
//

import SwiftUI

struct NYButtonModifier: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
        if theme == .secondary {
            content
                .font(.system(size: 20).weight(.bold))
                .padding()
                .frame(maxWidth: 318)
                .background(NYPalette.accentBackground)
                .foregroundColor(NYPalette.secondaryAccent)
                .cornerRadius(5)
        } else {
            content
                .font(.system(size: 20).weight(.bold))
                .padding()
                .frame(maxWidth: 318)
                .background(NYPalette.secondaryAccent)
                .foregroundColor(NYPalette.white)
                .cornerRadius(5)
        }
    }
}

extension Button {
    func applyStyle(theme: Theme) -> some View {
        modifier(NYButtonModifier(theme: theme))
    }
}

struct NYButton: View {
    let text: String
    let theme: Theme
    let action: () -> Void
    
    init(text: String, theme: Theme = .primary, action: @escaping () -> Void) {
        self.text = text
        self.theme = theme
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .applyStyle(theme: theme)
    }
}

struct NYButton_Previews: PreviewProvider {
    static var previews: some View {
        NYButton(text: "Get Started") {
            print("Hello World!")
        }
    }
}
