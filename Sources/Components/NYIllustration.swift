//
//  NYIllustration.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct NYIllustration: View {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(maxWidth: 232, maxHeight: 328)
            .aspectRatio(contentMode: .fit)
    }
}

struct NYIllustration_Previews: PreviewProvider {
    static var previews: some View {
        NYIllustration("NoteIllustration")
    }
}
