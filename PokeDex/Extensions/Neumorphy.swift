//
//  Neumorphy.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 27/05/21.
//

import SwiftUI

struct Neumorphy: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View{
        ZStack{
            content
        }
        .shadow(color: colorScheme == .light ? Color.black.opacity(0.2) : Color.neuDarkEnd, radius: 10, x: 10, y: 10)
        .shadow(color: colorScheme == .light ? Color.white.opacity(0.7) : Color.neuDarkStart, radius: 10, x: -5, y: -5)
        
    }
}

extension View {
    func neumorphy() -> some View {
        self.modifier(Neumorphy())
    }
}
