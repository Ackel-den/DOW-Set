//
//  CardifyAnimatableMod.swift
//  DOW-Set
//
//  Created by Денис Никитин on 17.07.2024.
//

import SwiftUI

struct CardifyAnimatableMod: AnimatableModifier {
    init(startFaceUp: Bool){
        rotation = startFaceUp ? 0 : 180
    }
    var animatableData: Double{
        get{rotation}
        set{rotation = newValue}
    }
    var rotation: Double
//    var selected: Bool
    
    func body(content: Content) -> some View {
        
    }
}

