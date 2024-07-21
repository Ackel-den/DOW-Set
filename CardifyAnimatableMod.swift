//
//  CardifyAnimatableMod.swift
//  DOW-Set
//
//  Created by Денис Никитин on 17.07.2024.
//

import SwiftUI

struct CardifyAnimatableMod: AnimatableModifier {
    init(startFaceUp: Bool, selected: Bool, isMatched: Bool){
        rotation = startFaceUp ? 0 : 180
        self.selected = selected
        self.isMatched = isMatched
        self.startFaceUp = startFaceUp
    }
    
    var animatableData: Double{
        get{rotation}
        set{rotation = newValue}
    }
    
    var rotation: Double
    var selected: Bool
    var isMatched: Bool
    var startFaceUp: Bool
    
    func body(content: Content) -> some View {
        let rectangle = RoundedRectangle(cornerRadius: 25.0)
        ZStack{
            if startFaceUp{
                if !isMatched {
                    if selected{
                        rectangle.strokeBorder(lineWidth: 5)
                            .foregroundColor(.yellow)
                    } else {
                        rectangle.strokeBorder(lineWidth: 5)
                            .foregroundColor(.black)
                    }
                } else {
                    rectangle
                        .foregroundColor(.red)
                }
            }else{
                rectangle
                    .foregroundColor(.red)
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(
            Angle.degrees(rotation), axis: (0, 1, 0))
        .animation(Animation.linear(duration: 1))
    }
}

extension View{
    func cardify(startFaceUp: Bool, selected: Bool, isMatched: Bool) -> some View{
        self.modifier(CardifyAnimatableMod(startFaceUp: startFaceUp, selected: selected, isMatched: isMatched))
    }
}

