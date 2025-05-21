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
    static let shared: Network = Network()
    private init() {}
    
    private func fetch(apiEndpoint: String?) async throws -> Data {
        let apiBase: String = "https://pokeapi.co/api/v2/pokemon"
        let urlString = apiBase + (apiEndpoint ?? "/")
        
        guard let apiURL = URL(string: urlString) else {
            throw NetworkErrors.urlError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: .init(url: apiURL))
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrors.requestError(NSError(domain: "Invalid response type", code: 0))
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkErrors.requestFailed(statusCode: httpResponse.statusCode)
            }
            
            guard !data.isEmpty else { throw NetworkErrors.noData }
            
            do {
                let result = try JSONDecoder().decode(ResultDTO.self, from: data)
                return data
            } catch {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Failed to decode: \(dataString)")
                }
                throw NetworkErrors.decodingError(error)
            }
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.requestError(error)
        }
    }
    
    func fetchPokemonList() async throws -> [PokemonDTO] {
        do {
            let data = try await fetch(apiEndpoint: "/")
            let result = try JSONDecoder().decode(ResultDTO.self, from: data)
            return result.results
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.requestError(error)
        }
    }
    
    func fetchDetail(name: String) async throws -> DetailDTO {
        do {
            let data = try await fetch(apiEndpoint: "/\(name)")
            let result = try JSONDecoder().decode(DetailDTO.self, from: data)
            return result
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.requestError(error)
        }
    }
}
