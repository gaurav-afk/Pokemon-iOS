//
//  ContentView.swift
//  Pokemon
//
//  Created by Gaurav Rawat on 2024-02-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)], animation: .default)
    private var pokedex: FetchedResults<Pokemon>

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(pokedex) { poke in
                    NavigationLink {
                        Text("\(poke.id) : \(poke.name!.capitalized)")
                    } label: {
                        Text("\(poke.id) : \(poke.name!.capitalized)")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
