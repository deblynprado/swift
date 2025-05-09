//
//  Network.swift
//  Pokemon
//
//  Created by Deblyn Prado on 06/05/25.
//

import Foundation

class Network {
    func fetchList(completion: @escaping ([PokemonDTO]) -> Void) {
        guard let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/") else { return }
        
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard let data else { return }
            do {
                let result = try JSONDecoder().decode(ResultDTO.self, from: data)
                completion(result.results)
            } catch {
                 
            }
        }
        .resume()
    }
}
