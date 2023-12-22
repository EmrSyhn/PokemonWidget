//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Emir Seyhan on 22.12.2023.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    
    @AppStorage("pokemon",store: UserDefaults(suiteName: "group.com.emirSyhn.PokemonWidget"))
                
                var pokemonData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(pokemonDizisi){pokemon in
                PokemonView(pokemon: pokemon).onTapGesture {
                    userDefaultSave(pokemon: pokemon)
                }
            }
        }
    }
    
    func userDefaultSave(pokemon : Pokemon) {
        
        if let pokemonData = try? JSONEncoder().encode(pokemon) {
            self.pokemonData = pokemonData
            print(pokemon.isim)
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetPokemon")
        }
        
        
    }
}

#Preview {
    ContentView()
}
