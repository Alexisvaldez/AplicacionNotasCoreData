//
//  AplicacionNotasApp.swift
//  AplicacionNotas
//
//  Created by user on 17/03/24.
//

import SwiftUI

@main
struct AplicacionNotasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
