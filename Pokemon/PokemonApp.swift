//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Gaurav Rawat on 2024-02-27.
//

import SwiftUI

@main
struct PokemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
