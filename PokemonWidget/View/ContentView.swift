//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Emir Seyhan on 22.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("pikachu")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            Image("bullbasaur")
                .resizable()
                .frame(width: 100,height: 100)
            Image("pokeball")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
        }
    }
}

#Preview {
    ContentView()
}
