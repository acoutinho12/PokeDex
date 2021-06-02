//
//  LinearGradient.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 01/06/21.
//

import SwiftUI

extension LinearGradient {

    init(_ colorScheme: ColorScheme) {
        let colors = colorScheme == .dark ? [Color.neuDarkStart, Color.neuDarkEnd] : [Color.neuWhiteStart, Color.neuWhiteEnd]
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static let neuFire      = LinearGradient(Color.neuFireStart, Color.neuFireEnd)
    static let neuPoison    = LinearGradient(Color.neuPoisonStart, Color.neuPoisonEnd)
    static let neuWater     = LinearGradient(Color.neuWaterStart, Color.neuWaterEnd)
    static let neuElectric  = LinearGradient(Color.neuElectricStart, Color.neuElectricEnd)
    static let neuPsychic   = LinearGradient(Color.neuPsychicStart, Color.neuPsychicEnd)
    static let neuGround    = LinearGradient(Color.neuGroundStart, Color.neuGroundEnd)
    static let neuFlying    = LinearGradient(Color.neuFlyingStart, Color.neuFlyingEnd)
    static let neuFairy     = LinearGradient(Color.neuFairyStart, Color.neuFairyEnd)
}

