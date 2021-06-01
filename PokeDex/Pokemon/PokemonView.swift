//
//  PokemonView.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import SwiftUI

struct PokemonView: View {
    @Environment(\.colorScheme) var colorScheme
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
                Text("PokeDex").font(.system(size: 48))
                LazyVGrid(columns: gridItems, content: {
                    ForEach(viewModel.model) { pokemon in
                        PokemonCard(image: pokemon.imageURL, name: pokemon.name)
                    }.padding()
                })
            }.background(colorScheme == .light ? LinearGradient(Color.neuWhiteStart, Color.neuWhiteEnd) : LinearGradient(Color.neuDarkStart, Color.neuDarkEnd))
        }
    }
}

