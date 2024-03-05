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
        NavigationStack {
            List(pokedex) { poke in
                NavigationLink(value: poke) {
                    AsyncImage(url: poke.sprite){ image in
                            image
                            .resizable()
                            .scaledToFit()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    
                        Text("\(poke.name!.capitalized)")
                    }
            }
            .navigationTitle("Pokedex")
            .navigationDestination(for: Pokemon.self, destination: { pokemon in
                AsyncImage(url: pokemon.sprite){ image in
                    image
                    .resizable()
                    .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            })
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
