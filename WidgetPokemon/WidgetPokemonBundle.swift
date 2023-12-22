//
//  WidgetPokemonBundle.swift
//  WidgetPokemon
//
//  Created by Emir Seyhan on 22.12.2023.
//

import WidgetKit
import SwiftUI

@main
struct WidgetPokemonBundle: WidgetBundle {
    var body: some Widget {
        WidgetPokemon()
        WidgetPokemonLiveActivity()
    }
}
