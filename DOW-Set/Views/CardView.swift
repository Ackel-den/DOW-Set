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
        let rectangle = RoundedRectangle(cornerRadius: 25.0)
            .stroke(lineWidth: 5)
            .fill()
        ZStack{
            if !content.isMatched{
                if content.selected{
                    rectangle.foregroundColor(.yellow)
                } else {
                    rectangle.foregroundColor(.black)
                }
                cardContent().aspectRatio(1/2, contentMode: .fit)
                    .padding(.all)
            }
        }
    }
    
    
    @ViewBuilder
    private func cardContent() -> some View{
        VStack{
            ForEach(0..<content.numberOfShapes){num in
                if content.content == Shapes.diamond{
                    if content.filling == Filling.empty{
                        Diamonds().stroke(lineWidth: 2).foregroundColor(content.color)
                    } else if content.filling == Filling.paintedOver{
                        Diamonds().foregroundColor(content.color)
                    } else {
                        Diamonds().foregroundColor(content.color).opacity(0.3)
                    }
                } else if content.content == Shapes.oval {
                    if content.filling == Filling.empty{
                        Oval().stroke(lineWidth: 2).foregroundColor(content.color)
                    } else if content.filling == Filling.paintedOver{
                        Oval().foregroundColor(content.color)
                    } else {
                        Oval().foregroundColor(content.color).opacity(0.3)
                    }
                } else {
                    if content.filling == Filling.empty{
                        Waves().stroke(lineWidth: 2).foregroundColor(content.color)
                    } else if content.filling == Filling.paintedOver{
                        Waves().foregroundColor(content.color)
                    } else {
                        Waves().foregroundColor(content.color).opacity(0.3)
                    }
                }
            }
        }
    }
}

//#Preview {
//    CardView()
//}
