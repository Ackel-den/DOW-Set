//
//  CardView.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 04.07.2024.
//

import SwiftUI


struct CardView: View  {
    let content: DOWSetGameModel.Card
    
    var body: some View {
        GeometryReader{ geometry in            
            ZStack{
                cardContent(content).aspectRatio(1/2, contentMode: .fit)
                        .padding(.all)
            }
            .cardify(startFaceUp: content.startFaceUp, selected: content.selected, isMatched: content.isMatched)
        }
    }
}
    
    @ViewBuilder
    private func cardContent(_ content: DOWSetGameModel.Card) -> some View{
        let shape = chooseShape(content.content)
        let numbers = content.numberOfShapes
        VStack{
            ForEach(1...numbers, id: \.self){_ in
                switch content.filling{
                case .empty:
                    AnyView(shape.stroke(lineWidth: 2).foregroundColor(content.color))
                case .paintedOver:
                    AnyView(shape.foregroundColor(content.color))
                case .translucent:
                    AnyView(shape.foregroundColor(content.color).opacity(0.2))
                }
            }
        }
    }
    
    private func chooseShape(_ shapes: Shapes) -> any Shape{
        switch shapes{
        case .diamond:
            return Diamonds()
        case .oval:
            return Oval()
        case .waves:
            return Waves()
        }
    }

    
//if content.startFaceUp{
//if !content.isMatched {
//    if content.selected{
//        rectangle.strokeBorder(lineWidth: 5)
//            .foregroundColor(.yellow)
//    } else {
//        rectangle.strokeBorder(lineWidth: 5)
//            .foregroundColor(.black)
//    }
//        cardContent(content).aspectRatio(1/2, contentMode: .fit)
//            .padding(.all)
//}
//} else {
//rectangle
//    .foregroundColor(.red)
//}
