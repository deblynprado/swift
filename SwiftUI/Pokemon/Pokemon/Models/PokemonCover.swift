//
//  PokemonCover.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//
import Foundation

struct PokemonCover {
    let baseImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    let indexImage: Int
    let imageExtesion = ".png"
    var image: URL? {
        URL(string: String(baseImage + String(indexImage) + imageExtesion))
    }

}
