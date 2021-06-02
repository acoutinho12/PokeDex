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
                
                HStack{
                    Text("PokeDex").font(Font.custom("Pokemon Solid", size:40))
                    VStack(alignment:.trailing){
                        Text("Colored").font(Font.custom("Pokemon Solid", size:16))
                        Toggle("", isOn: $viewModel.inColors).toggleStyle(SwitchToggleStyle(tint: Color(UIColor.label)))
                    }
                }.padding()
                
                LazyVGrid(columns: gridItems, content: {
                    ForEach(viewModel.model) { pokemon in
                        PokemonCard(image: pokemon.imageURL, name: pokemon.name, cardColor: viewModel.cardColor(forType: pokemon.type, colorScheme: colorScheme))
                    }.padding()
                })
            }.background(LinearGradient(colorScheme))
        }
    }
}

