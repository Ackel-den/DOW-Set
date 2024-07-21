//
//  TheDeckBuilder.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import Foundation
import SwiftUI


protocol TheDeckBuilderProtocol{
    mutating func makeDeck() -> Array<DOWSetGameModel.Card>
}

class TheDeckBuilder: TheDeckBuilderProtocol{
    func makeDeck() -> Array<DOWSetGameModel.Card>{
        var theDeck = [DOWSetGameModel.Card]()
        let colors: [Color] = [.green, .red, .purple]
        for color in colors {
            for filling in Filling.allCases{
                for shape in Shapes.allCases{
                    for n in 1...3{
                        theDeck.append(DOWSetGameModel.Card(content: shape, numberOfShapes: n, color: color, filling: filling, id: (theDeck.count + 1)))
                    }
                }
            }
        }
        return theDeck
    }
}

