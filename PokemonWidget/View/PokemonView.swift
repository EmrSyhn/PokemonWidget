//
//  PokemonView.swift
//  PokemonWidget
//
//  Created by Emir Seyhan on 22.12.2023.
//

import SwiftUI

struct PokemonView: View {
    var pokemon : Pokemon
    
    var body: some View {
        HStack {
            OzelGorsel(imageText: "\(pokemon.gorselIsmi)").frame(width: 100,height: 100)
            Spacer()
            VStack(alignment:.leading) {
                Text(pokemon.isim)
                    .font(.largeTitle)
                    .bold()
                Text(pokemon.tur)
                    .fontWeight(.heavy)
            }
            Spacer()
        }.padding()
            .frame(width: UIScreen.main.bounds.width)
       
    }
}

#Preview {
    PokemonView(pokemon: pikachu)
}
