//
//  Network.swift
//  Pokemon
//
//  Created by Deblyn Prado on 06/05/25.
//

import Foundation

enum NetworkErrors: Error, LocalizedError {
    case urlError
    case requestFailed(statusCode: Int)
    case decodingError(Error)
    case noData
    case requestError(Error)
    
    var errorDescription: String? {
        switch self {
        case .urlError:
            return "The URL provided is invalid"
        case .requestFailed(let statusCode):
            return "Request Faild with Status Code: \(statusCode)"
        case .decodingError(let error):
            return "Failed to decode response: \(error)"
        case .noData:
            return "No Data Returned"
        case .requestError(let error):
            return "Request Error: \(error)"
        }
    }
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
    
//    func fetchList() async throws -> [PokemonDTO] {
//        guard let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
//            throw NetworkErrors.urlError
//        }
//        do {
//            let (data, response) = try await URLSession.shared.data(for: .init(url: apiURL))
//            let result = try JSONDecoder().decode(ResultDTO.self, from: data)
//            return result.results
//        } catch {
//            throw NetworkErrors.noData
//        }
//    }
    
    func fetchPokemons() async throws -> [PokemonDTO] {
        do {
            guard let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
                throw NetworkErrors.urlError
            }

            let (data, response) = try await URLSession.shared.data(for: .init(url: apiURL))

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrors.requestError(NSError(domain: "Invalid response type", code: 0))
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkErrors.requestFailed(statusCode: httpResponse.statusCode)
            }

            guard !data.isEmpty else {
                throw NetworkErrors.noData
            }

            do {
                let result = try JSONDecoder().decode(ResultDTO.self, from: data)
                return result.results
            } catch {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Failed to decode: \(dataString)")
                }
                throw NetworkErrors.decodingError(error)
            }
        }
        catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.requestError(error)
        }
    }
}
