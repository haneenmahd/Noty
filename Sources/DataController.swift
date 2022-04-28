//
//  DataController.swift
//  Noty
//
//  Created by Haneen Mahdin on 23/04/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Noty")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return Self.persistentContainer.viewContext
    }
}
