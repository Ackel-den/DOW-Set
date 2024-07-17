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
    var theDeck = [DOWSetGameModel.Card]()
    var colors: [Color] = [.green, .red, .purple]
    
    func makeDeck() -> Array<DOWSetGameModel.Card>{
        for c in colors {
            for f in Filling.allValues{
                for s in Shapes.allValue{
                    for n in 1...3{
                        theDeck.append(DOWSetGameModel.Card(content: s, numberOfShapes: n, color: c, filling: f, id: (theDeck.count + 1)))
                    }
                }
            }
        }
        
        return theDeck
    }
    
}

