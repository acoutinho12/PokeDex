// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemon = try? newJSONDecoder().decode(Pokemon.self, from: jsonData)

import Foundation

// MARK: - PokemonClass
struct PokemonClass: Codable, Identifiable {
    let attack, defense: Int
    let pokemonDescription: String
    let evolutionChain: [EvolutionChain]?
    let height, id: Int
    let imageURL: String
    let name, type: String
    let weight: Int
    let pokemonDefense: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense
        case pokemonDescription = "description"
        case evolutionChain, height, id
        case imageURL = "imageUrl"
        case name, type, weight
        case pokemonDefense = "defense:"
    }
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let id, name: String
}

typealias Pokemon = [PokemonClass]
