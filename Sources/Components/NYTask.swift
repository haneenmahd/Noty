//
//  NYTask.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct NYTask: View {
    let emoji: String
    let task: String
    let taskState: NYTaskState
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.system(size: 18))
            
            Spacer()
            
            NYText(task, font: .subheadline)
                .lineLimit(1)
                .padding()
            
            Spacer()
            
            NYTaskStatus(state: taskState)
        }
        .padding()
    }
}

struct NYTask_Previews: PreviewProvider {
    static var previews: some View {
        NYTask(emoji: "🛌", task: "Read 100 pages of 'Atomic Habits'", taskState: .inactive)
    }
}
