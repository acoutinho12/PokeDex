//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    private let pokemonURL = Route.pokemonURL
    @Published var model: Pokemon = []{
        didSet{
            self.isLoading = false;
        }
    }
    @Published var isLoading:Bool = true
    @Published var inColors:Bool = false
    
    public func cardColor(forType type: String, colorScheme: ColorScheme) -> LinearGradient{
        if !self.inColors{
            return LinearGradient(colorScheme);
        }
        
        switch type {
            case "fire":
                return LinearGradient.neuFire
            case "poison":
                return LinearGradient.neuPoison
            case "water":
                return LinearGradient.neuWater
            case "electric":
                return LinearGradient.neuElectric
            case "psychic":
                return LinearGradient.neuPsychic
            case "normal":
                return LinearGradient(colorScheme)
            case "ground":
                return LinearGradient.neuGround
            case "flying":
                return LinearGradient.neuFlying
            case "fairy":
                return LinearGradient.neuFairy
            default:
                return LinearGradient(colorScheme)
        }
    }
    
    public func getPokemons() -> Void {
            
            do {
                Network().get(from: pokemonURL, resultType: Pokemon.self)
                { pokemonResponse in
                    DispatchQueue.main.async {
                        self.model = pokemonResponse!
                    }
                }
            }
    }
}
