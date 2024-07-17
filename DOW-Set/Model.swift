//
//  Model.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import Foundation
import SwiftUI

struct DOWSetGameModel{
    var gameStart = false
    var theDeck: [Card]
    var cardsOnTable: [Card]
    var firstSelectedCard: Int?
    var secondSelectedCard: Int?
    
    init() {
        cardsOnTable = []
        let deckBuilder = TheDeckBuilder()
        theDeck = deckBuilder.makeDeck()
        theDeck.shuffle()
        for i in 0...11{
            cardsOnTable.append(theDeck[i])
            theDeck.remove(at: i)
        }
    }

    
    mutating func choose(_ card: Card){
            if let chosenIndex = cardsOnTable.firstIndex(where: {$0.id == card.id}){
                if !cardsOnTable[chosenIndex].selected{
                    if let firstPotentialMatchIndex = firstSelectedCard{
                        if let secondPotentialMatchIndex = secondSelectedCard{
                            if checkSet(firstPotentialMatchIndex, secondPotentialMatchIndex, chosenIndex){
                                print("set!")
                                cardsOnTable[firstPotentialMatchIndex].isMatched = true
                                cardsOnTable[secondPotentialMatchIndex].isMatched = true
                                cardsOnTable[chosenIndex].isMatched = true
                                firstSelectedCard = nil
                                secondSelectedCard = nil
                                addThreeCards()
                            } else {
                                print("Not set!")
                                cardsOnTable[firstPotentialMatchIndex].selected = false
                                cardsOnTable[secondPotentialMatchIndex].selected = false
                                cardsOnTable[chosenIndex].selected = false
                                firstSelectedCard = chosenIndex
                                secondSelectedCard = nil
                            }
                        } else {
                            secondSelectedCard = chosenIndex
                        }
                    } else {
                        firstSelectedCard = chosenIndex
                    }
                    cardsOnTable[chosenIndex].selected = true
                } else {
                    cardsOnTable[chosenIndex].selected = false
                }
            }
        }
    
    // добавление трёх карт на поле
        
    mutating func addThreeCards(){
            if theDeck.count != 0{
                for _ in 1...3{
                    cardsOnTable.append(theDeck[0])
                    theDeck.remove(at: 0)
                }
                for i in 0..<cardsOnTable.count{
                    cardsOnTable[i].startFaceUp = true
                }
            }
        }
    // изменение переменной gameStart
    
    mutating func changeStartGame(){
        gameStart.toggle()
        if gameStart {
            for i in 0..<cardsOnTable.count{
                cardsOnTable[i].startFaceUp = true
            }
        }
    }
    
    // проверка set
    
    private func checkSet(_ first: Int, _ second: Int, _ third: Int) -> Bool {
        if (checkColor()&&checkShapes()&&checkFilling()&&checkNumbers()){
            return true
        }else{
            return false
        }
        
         func checkColor() -> Bool{
            if (cardsOnTable[first].color == cardsOnTable[second].color && cardsOnTable[first].color == cardsOnTable[third].color) ||
                (cardsOnTable[first].color != cardsOnTable[second].color
                 && cardsOnTable[first].color != cardsOnTable[third].color
                 && cardsOnTable[second].color != cardsOnTable[third].color){
                return true
            } else {
                return false
            }
        }
        
         func checkNumbers() -> Bool{
            if (cardsOnTable[first].numberOfShapes == cardsOnTable[second].numberOfShapes && cardsOnTable[first].numberOfShapes == cardsOnTable[third].numberOfShapes) ||
                (cardsOnTable[first].numberOfShapes != cardsOnTable[second].numberOfShapes
                 && cardsOnTable[first].numberOfShapes != cardsOnTable[third].numberOfShapes
                 && cardsOnTable[second].numberOfShapes != cardsOnTable[third].numberOfShapes){
                return true
            } else {
                return false
            }
        }
        
         func checkFilling() -> Bool{
            if (cardsOnTable[first].filling == cardsOnTable[second].filling && cardsOnTable[first].filling == cardsOnTable[third].filling) ||
                (cardsOnTable[first].filling != cardsOnTable[second].filling
                 && cardsOnTable[first].filling != cardsOnTable[third].filling
                 && cardsOnTable[second].filling != cardsOnTable[third].filling){
                return true
            } else {
                return false
            }
        }
        
         func checkShapes() -> Bool{
            if (cardsOnTable[first].content == cardsOnTable[second].content && cardsOnTable[first].content == cardsOnTable[third].content) ||
                (cardsOnTable[first].content != cardsOnTable[second].content
                 && cardsOnTable[first].content != cardsOnTable[third].content
                 && cardsOnTable[second].content != cardsOnTable[third].content){
                return true
            } else {
                return false
            }
        }
    }
  

    
    //  структура карты

    struct Card: Identifiable{
        let content: Shapes
        let numberOfShapes: Int
        let color: Color
        let filling: Filling
        var selected = false
        var isMatched = false
        var startFaceUp = false
        
        var id: Int
    }
}

