//
//  TaskExpanded.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct TaskExpanded: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var isRootPresented: Binding<PresentationMode>
    let goal: String
    let taskObj: TaskObject
    
    @State private var showingAlert = false
    @State private var isTaskDone = false
    
    var navigationHeader: some View {
        HStack(spacing: 15) {
            Button {
                isRootPresented.wrappedValue.dismiss()
            } label: {
                NYIcon(iconName: "arrow.left", iconWeight: .regular)
            }
            
            
            HStack {
                Text(taskObj.emoji ?? "😑")
                
                NYText(taskObj.title ?? "Empty")
                    .lineLimit(1)
            }
            .padding(0)
            
            Spacer()
            
            HStack {
                Button {
                    taskObj.status.toggle()
                    isTaskDone = taskObj.status
                    
                    let context = DataController().context
                    
                    try! context.save()
                } label: {
                    NYTaskStatus(state: isTaskDone ? .done : .loading)
                }
                .onAppear {
                    isTaskDone = taskObj.status
                }
                
                Button(role: .destructive) {
                    showingAlert = true
                } label: {
                    NYIcon(iconName: "trash", iconColor: .red, iconWeight: .regular)
                }
            }
        }
        .padding()
        .background(NYPalette.white)
        .zIndex(2)
    }
    
    var goalView: some View {
        VStack(alignment: .leading, spacing: 10) {
            NYText("Goal", font: .title)
            
            NYText(goal.isEmpty ? "Empty" : goal, font: .description)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            navigationHeader
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    goalView
                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
            }
        }
        .alert("Are you sure you wanna delete?", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {
                context.performAndWait {
                    context.delete(taskObj)
                    
                    try! context.save()
                }
                
                isRootPresented.wrappedValue.dismiss()
            }
        }
        
        .navigationBarHidden(true)
    }
}

struct TaskExpanded_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) static var context
    @FetchRequest(sortDescriptors: []) static var taskObjects: FetchedResults<TaskObject>
    
    static var previews: some View {
        TaskExpanded(goal: "Wake up early in the morning and be able to get more things done before anyone.", taskObj: taskObjects[0])
    }
}
