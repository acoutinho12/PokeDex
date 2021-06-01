//
//  LinearGradient.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 01/06/21.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
