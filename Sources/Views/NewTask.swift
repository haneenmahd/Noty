//
//  NewTask.swift
//  Noty
//
//  Created by Haneen Mahdin on 23/04/22.
//

import SwiftUI

struct NewTask: View {
    let isSheetPresented: Binding<Bool>
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var taskObjects: FetchedResults<TaskObject>
    
    @State private var isShowingAlert = false
    @State private var emoji = "🏋️‍♀️"
    @State private var taskTitle = ""
    @State private var goal = ""
    @State private var subTasks = [String]()
    @State private var currentSubTask = ""
    @State private var taskEdit = false
    
    var emojiSection: some View {
        TextField("", text: $emoji)
            .multilineTextAlignment(.center)
            .font(.system(size: 70))
            .padding()
            .background(NYPalette.inactive)
            .cornerRadius(100)
            .frame(maxWidth: 150, idealHeight: 150)
    }
    
    var nameSection: some View {
        Section {
            NYText("Title: ")
            
            TextField("Lift 250 lbs this week", text: $taskTitle)
                .padding()
                .background(NYPalette.textFieldBackground)
                .cornerRadius(10)
        }
    }
    
    var goalSection: some View {
        Section {
            NYText("Goal: ")
            
            TextField("Increase my positivity and mindset", text: $goal)
                .padding()
                .background(NYPalette.textFieldBackground)
                .cornerRadius(10)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                emojiSection
                
                nameSection
                
                goalSection
                
                NYButton(text: "Create Note") {
                    saveNewTask()
                }
            }
            .padding(30)
        }
    }
    
    private func saveNewTask() {
        let newTaskObj = TaskObject(context: context)
        
        newTaskObj.id = UUID()
        newTaskObj.emoji = emoji
        newTaskObj.title = taskTitle
        newTaskObj.goal = goal
        newTaskObj.status = false
        
        try! context.save()
        
        isSheetPresented.wrappedValue = false
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask(isSheetPresented: .constant(true))
            
    }
}
