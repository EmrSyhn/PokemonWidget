//
//  Pokemon.swift
//  PokemonWidget
//
//  Created by Emir Seyhan on 22.12.2023.
//

import Foundation


struct Pokemon : Identifiable, Codable {
    
    let gorselIsmi : String
    let isim : String
    let tur : String
    
    var id : String {
        gorselIsmi
    }
}
let pikachu = Pokemon(gorselIsmi: "pikachu", isim: "Pikachu", tur: "Mouse Pokemon")
let pokeball = Pokemon(gorselIsmi: "pokeball", isim: "Poké Ball", tur: "Poké Ball")
let bulbasaur = Pokemon(gorselIsmi: "bullbasaur", isim: "Bulbasaur", tur: "Seed Pokémon")
