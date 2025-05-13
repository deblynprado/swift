//
//  Network.swift
//  Pokemon
//
//  Created by Deblyn Prado on 06/05/25.
//

import Foundation

enum NetworkErrors: Error {
    case urlError
    case requestError
}

class Network {
//    func fetchList(completion: @escaping ([PokemonDTO]) -> Void) throws {
//        guard let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/") else { return }
//        URLSession.shared.dataTask(with: apiURL) { data, response, error in
//            guard let data else { return }
//            do {
//                let result = try JSONDecoder().decode(ResultDTO.self, from: data)
//                completion(result.results)
//            } catch {
//                throw NetworkErrors.requestError
//            }
//        }
//        .resume()
//    }
    
    func fetchList() async throws -> [PokemonDTO] {
        guard let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
            throw NetworkErrors.urlError
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: .init(url: apiURL))
            let result = try JSONDecoder().decode(ResultDTO.self, from: data)
            return result.results
        } catch {
            throw NetworkErrors.requestError
        }
    }
}
