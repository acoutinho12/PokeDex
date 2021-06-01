//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    var auxArray:[Int] = Array(0...1000)
    
    @Published var model: [Pokemon] = []{
        didSet{
            self.isLoading = false;
        }
    }
    @Published var isLoading:Bool = true
    
    public func getPokemons() -> Void {
        let rota = Route().pokemonURL
        for id in auxArray {
            let pokemonTypeURL:String = "\(rota)\(id)"
            guard let url = URL(string: pokemonTypeURL) else { return }
            do {
                Network().get(from: url, resultType: Pokemon.self)
                { PokemonTypeResponse in
                    DispatchQueue.main.async {
                        self.model.append(PokemonTypeResponse!)
                    }
                }
            }
        }
    }
}
