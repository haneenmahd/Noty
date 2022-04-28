//
//  NYTaskStatus.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

enum NYTaskState {
    case done, loading, inactive
}

struct NYTaskStatus: View {
    let state: NYTaskState
    
    var body: some View {
        NYIcon(iconName: state == .done ? "checkmark.circle.fill" : state == .loading ? "checkmark.circle" : "circle.circle", iconColor: state == .done ? .success : state == .loading ? .loading : .inactive, iconWeight: .regular)
    }
}

struct NYTaskStatus_Previews: PreviewProvider {
    static var previews: some View {
        NYTaskStatus(state: .loading)
    }
}
