//
//  DetailView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 13/05/25.
//

import SwiftUI

struct DetailView: View {
    var pokemon: Pokemon
    var body: some View {
        HStack {
            Text(pokemon.data.name)
            Text(pokemon.data.type[0])
            var test = Color.typeGrass
        }
        .frame(maxWidth: .infinity)
        .background(Color.typeGrass)
    }
}

#Preview {
    DetailView(pokemon: .init(data: .init(name: "Bulbasaur", type: ["grass"]), cover: .init(indexImage: 1)))
}
