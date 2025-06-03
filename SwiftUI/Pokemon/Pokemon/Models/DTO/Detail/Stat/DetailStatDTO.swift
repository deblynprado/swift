//
//  DetailStatDTO.swift
//  Pokemon
//
//  Created by Deblyn Prado on 30/05/25.
//

import Foundation

struct DetailStatDTO: Decodable {
    let base_stat: Int
    let effort: Int
    let stat: StatDTO
}
