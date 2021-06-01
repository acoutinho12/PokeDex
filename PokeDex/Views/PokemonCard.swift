//
//  PokemonCard.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct PokemonCard: View {
    @Environment(\.colorScheme) var colorScheme
    
    let image: String
    let name: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).fill(colorScheme == .light ?  LinearGradient(Color.neuWhiteStart, Color.neuWhiteEnd) : LinearGradient(Color.neuDarkStart, Color.neuDarkEnd))
            VStack{
                HStack(alignment:.top){
                    WebImage(url: URL(string: image))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                }
                Text(name)
                    .foregroundColor(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
            }
            .padding(4)

        }.neumorphy()
        
    }
}
