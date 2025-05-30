//
//  DetailDTO.swift
//  Pokemon
//
//  Created by Deblyn Prado on 20/05/25.
//
import Foundation

struct DetailDTO: Decodable {
    let types: [detailTypeDTO]
    let order: Int
    let height: Int
    let weight: Int
}
