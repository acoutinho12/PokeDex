//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import Foundation

class PokemonViewModel: ObservableObject {
    private let pokemonURL = Route.pokemonURL
    @Published var model: Pokemon = []{
        didSet{
            self.isLoading = false;
        }
    }
    @Published var isLoading:Bool = true
    
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
