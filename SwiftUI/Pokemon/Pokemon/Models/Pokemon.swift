//
//  Pokemon.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//
import Foundation
import SwiftUI

struct Pokemon: Identifiable {
    let id = UUID()
    
    let data: PokemonDTO
    let cover: PokemonCover
    let typeColor: PokemonType
}
