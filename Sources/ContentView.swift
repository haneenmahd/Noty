//
//  ContentView.swift
//  Noty
//
//  Created by Haneen Mahdin on 20/04/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.status)
    ]) var taskObjects: FetchedResults<TaskObject>
    
    @State private var showDashboard = false
    let isFirstTime = hasLauchedBefore()
    
    var body: some View {
        if isFirstTime && !showDashboard {
            GetStarted(showDashboard: $showDashboard)
        } else {
            Dashboard(taskObjects: taskObjects)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
