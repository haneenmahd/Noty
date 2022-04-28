//
//  NotyApp.swift
//  Noty
//
//  Created by Haneen Mahdin on 20/04/22.
//

import SwiftUI

@main
struct NotyApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.context)
        }
    }
}
