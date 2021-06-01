//
//  PokemonView.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import SwiftUI

struct PokemonView: View {
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    @ObservedObject var viewModel:PokemonViewModel = PokemonViewModel();
    var body: some View {
        if viewModel.isLoading
        {
            ProgressView("Aguarde...").onAppear(perform: {
                viewModel.getPokemons();
            })
        }
        else{
            ScrollView([.vertical], showsIndicators: false){
                Text("Pokemons").font(.system(size: 48))
                LazyVGrid(columns: gridItems, content: {
                    ForEach(viewModel.model) { pokemon in
                        PokemonCard(imagem: pokemon.sprites.other!.officialArtwork.frontDefault, name: pokemon.name, types:pokemon.types)
                    }.padding()
                })
            }
        }
    }
}

