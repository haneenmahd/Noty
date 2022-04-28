//
//  Dashboard.swift
//  Noty
//
//  Created by Haneen Mahdin on 21/04/22.
//

import SwiftUI

struct Dashboard: View {
    @Environment(\.managedObjectContext) var context
    let taskObjects: FetchedResults<TaskObject>
    
    @State private var isSheetPresented = false
    @State private var showingAlert = false
    
    var navigation: some View {
        HStack {
            HStack {
                NYText("🎯")
                
                NYText("Daily Goal", font: .navigationTitle)
            }
            
            Spacer()
            
            HStack {
                Button {
                    isSheetPresented = true
                } label: {
                    NYIcon(iconName: "plus", iconColor: .success)
                }
                
                Menu {
                    Button(role: .destructive) {
                        showingAlert = true
                    } label: {
                        NYIcon(iconName: "trash", iconColor: .red, iconWeight: .regular)
                        
                        Text("Delete All")
                            .font(.subheadline.weight(.semibold))
                    }
                } label: {
                    NYIcon(iconName: "ellipsis")
                }
            }
        }
        .padding()
    }
    
    var dailyQuoteView: some View {
        ZStack {
            Rectangle()
                .fill(NYPalette.sweetMint)
                .frame(maxWidth: .infinity, minHeight: 230)
            
            Text("Don't hesitate, these are your goals.")
                .font(.system(size: 18).weight(.medium))
                .foregroundColor(.white)
                .opacity(0.6)
        }
    }
    
    var tasksView: some View {
        VStack(spacing: 9) {
            if taskObjects.count > 0 {
                ForEach(taskObjects, id: \.self.id) { task in
                    
                    NavigationLink(destination: {
                        TaskExpanded(goal: task.goal ?? "", taskObj: task)
                    }, label: {
                        NYTask(emoji: task.emoji ?? "⁉️", task: task.title ?? "Unknown", taskState: task.status ? .done : .loading)
                    })
                    
                }
            } else {
                Spacer()
                Spacer()
                
                Image(systemName: "pencil.and.outline")
                    .font(.system(size: 100))
                    .foregroundColor(.secondary)
                
                NYText("Your tasks are Empty!", font: .description)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NYButton(text: "New Note", theme: .secondary) {
                    isSheetPresented = true
                }
            }
        }
        .padding()
        .animation(.spring(), value: taskObjects.count)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    navigation
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            dailyQuoteView
                            
                            tasksView
                        }
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                NewTask(isSheetPresented: $isSheetPresented)
            }
            .alert("Are you sure you wanna delete all notes?", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {
                    context.performAndWait {
                        for task in taskObjects {
                            context.delete(task)
                            
                            try! context.save()
                        }
                    }
                }
            }
            
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) static var taskObjects: FetchedResults<TaskObject>
    
    static var previews: some View {
        Dashboard(taskObjects: taskObjects)
    }
}
