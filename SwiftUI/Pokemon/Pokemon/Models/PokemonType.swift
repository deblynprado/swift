//
//  PokemonType.swift
//  Pokemon
//
//  Created by Deblyn Prado on 14/05/25.
//

import Foundation
import SwiftUI


struct PokemonType {
    let apiType: String
    
    func getColor() -> Color {
        let type = PokemonTypes(rawValue: apiType) ?? .unknown
        return type.getColor()
    }
    
    enum PokemonTypes: String {
        case bug = "bug"
        case dark = "dark"
        case dragon = "dragon"
        case electric = "electric"
        case fairy = "fairy"
        case fighting = "fighting"
        case fire = "fire"
        case flying = "flying"
        case ghost = "ghost"
        case normal = "normal"
        case grass = "grass"
        case ground = "ground"
        case ice = "ice"
        case poison = "poison"
        case psychic = "psychic"
        case rock = "rock"
        case steel = "steel"
        case water = "water"
        case unknown
    
        func getColor() -> Color {
            switch self {
            case .bug:
                return Color.typeBug
            case .dark:
                return Color.typeDark
            case .dragon:
                return Color.typeDragon
            case .electric:
                return Color.typeElectric
            case .fairy:
                return Color.typeFairy
            case .fighting:
                return Color.typeFighting
            case .fire:
                return Color.typeFire
            case .flying:
                return Color.typeFlying
            case .ghost:
                return Color.typeGhost
            case .normal:
                return Color.typeNormal
            case .grass:
                return Color.typeGrass
            case .ground:
                return Color.typeGround
            case .ice:
                return Color.typeIce
            case .poison:
                return Color.typePoison
            case .rock:
                return Color.typeRock
            case .steel:
                return Color.typeSteel
            case .water:
                return Color.typeWater
            case .unknown:
                return Color.white
            case .psychic:
                return Color.typePyshic
            }
        }
    }
}

extension PokemonType {
    var color: Color {
        let type = PokemonTypes(rawValue: apiType) ?? .unknown
        return type.getColor()
    }
}
