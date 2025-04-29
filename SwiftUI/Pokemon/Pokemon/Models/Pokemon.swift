//
//  Pokemon.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//
import Foundation

struct Pokemon: Identifiable {
    let id = UUID()
    
    let name: String
    let cover: PokemonCover
}
