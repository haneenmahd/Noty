//
//  TaskList.swift
//  Noty
//
//  Created by Haneen Mahdin on 24/04/22.
//

import SwiftUI

struct TaskList: View {
    let taskObjects: FetchedResults<TaskObject>
    
    var body: some View {
        VStack(spacing: 9) {
            ForEach(taskObjects, id: \.self.id) { task in
                NavigationLink(destination: {
                    TaskExpanded(goal: task.goal ?? "", taskObj: task)
                }, label: {
                    NYTask(emoji: task.emoji ?? "⁉️", task: task.title ?? "Unknown", taskState: task.status ? .done : .loading)
                })
            }
        }
        .padding()
    }
}

struct TaskList_Previews: PreviewProvider {
    @FetchRequest(sortDescriptors: []) static var taskObjects: FetchedResults<TaskObject>
    
    static var previews: some View {
        TaskList(taskObjects: taskObjects)
    }
}
