//
//  WidgetPokemon.swift
//  WidgetPokemon
//
//  Created by Emir Seyhan on 22.12.2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    @AppStorage("pokemon",store: UserDefaults(suiteName: "group.com.emirSyhn.PokemonWidget"))
    var pokemonData : Data = Data()
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), pokemond: pokeball)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemond: pokemon)
            return entry
        }else {
            // Return a default entry if needed
            return SimpleEntry(date: Date(), configuration: configuration, pokemond: Pokemon(gorselIsmi: "pikachu", isim: "pikacu", tur: "toprak"))
        }
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let defaultPokemon = Pokemon(gorselIsmi: "pikachu", isim: "pikacu", tur: "toprak")
        let defaultEntry = SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), pokemond: defaultPokemon)

        if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, pokemond: pokemon)
            return Timeline(entries: [entry], policy: .never)
        } else {
            // Return a default timeline if needed
            return Timeline(entries: [defaultEntry], policy: .never)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let pokemond : Pokemon
}

struct WidgetPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        OzelGorsel(imageText: "\(entry.pokemond.gorselIsmi)")
    }
}

struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                
        }
    }
}
