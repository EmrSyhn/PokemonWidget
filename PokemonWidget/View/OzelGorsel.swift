//
//  OzelGorsel.swift
//  PokemonWidget
//
//  Created by Emir Seyhan on 22.12.2023.
//

import SwiftUI

struct OzelGorsel: View {
    var imageText : String
    var body: some View {
        Image("\(imageText)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.green,lineWidth: 5))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    OzelGorsel(imageText: "pikachu")
}
