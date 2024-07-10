//
//  TheDeckBuilder.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import Foundation
import SwiftUI
//content: Shapes, color: Color, filling: Filling
protocol TheDeckBuilderProtocol{
    mutating func makeDeck() -> Array<DOWSetGameModel.Card>
//    func setCardsForTable() -> Array<DOWSetGameModel.Card>
}

class TheDeckBuilder: TheDeckBuilderProtocol{
    var theDeck = [DOWSetGameModel.Card]()
    var id: Int = 0
    
    func makeDeck() -> Array<DOWSetGameModel.Card>{
        theDeck = []
        for i in 1...3{
            if i == 1 { //green
                fillings(color: .green)
            } else if i == 2 { // red
                fillings(color: .red)
            } else { // purple
                fillings(color: .purple)
            }
        }
         func fillings(color: Color) {
            var fillings: Filling?
            for i in 1...3{
                if i == 1 {
                    fillings = Filling.empty
                } else if i == 2 {
                    fillings = Filling.paintedOver
                } else {
                    fillings = Filling.translucent
                }
                chooseWhatAppend(color: color, filling: fillings!)
            }
        }
        
         func chooseWhatAppend(color: Color, filling: Filling){
            appendInDeck(content: .diamond, color: color, filling: filling)
            appendInDeck(content: .oval, color: color, filling: filling)
            appendInDeck(content: .waves, color: color, filling: filling)
        }
        
         func appendInDeck(content: Shapes, color: Color, filling: Filling){
            for num in 1...3{
                theDeck.append(DOWSetGameModel.Card(content: content, numberOfShapes: num, color: color, filling: filling, id: id))
                id += 1
            }
        }
        return theDeck
    }
    
}

