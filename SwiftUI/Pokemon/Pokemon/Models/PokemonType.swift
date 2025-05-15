//
//  PokemonType.swift
//  Pokemon
//
//  Created by Deblyn Prado on 14/05/25.
//

import Foundation
import SwiftUI

struct PokemonType {
    enum PokemonTypes {
        case bug
        case dark
        case dragon
        case electric
        case fairy
        case fighting
        case fire
        case flying
        case ghost
        case normal
        case grass
        case ground
        case ice
        case poison
        case psychic
        case rock
        case steel
        case water
        
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
            default:
                return Color.white
            }
        }
    }
}
