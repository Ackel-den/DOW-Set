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
    var endGame: Bool
    
    init() {
        cardsOnTable = []
        let deckBuilder = TheDeckBuilder()
        theDeck = deckBuilder.makeDeck()
        theDeck.shuffle()
        for i in 0...11{
            cardsOnTable.append(theDeck[i])
            theDeck.remove(at: i)
        }
        endGame = false
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cardsOnTable.firstIndex(where: {$0.id == card.id}){
            guard cardsOnTable[chosenIndex].selected else {
                if let firstPotentionalIndex = firstSelectedCard{
                    if let secondPotentionalIndex = secondSelectedCard{
                        if checkSet(firstPotentionalIndex, secondPotentionalIndex, chosenIndex){
                            cardsOnTable[firstPotentionalIndex].isMatched = true
                            cardsOnTable[secondPotentionalIndex].isMatched = true
                            cardsOnTable[chosenIndex].isMatched = true
                            firstSelectedCard = nil
                            secondSelectedCard = nil
                            deleteMatchedCards()
                        } else {
                            print("Not set!")
                            for i in 0..<cardsOnTable.count{
                                cardsOnTable[i].selected = false
                            }
                            secondSelectedCard = nil
                            firstSelectedCard = chosenIndex
                            cardsOnTable[chosenIndex].selected = true
                        }
                    }
                    else{
                        secondSelectedCard = selectedCard(chosenIndex)
                    }
                } else {
                    firstSelectedCard = selectedCard(chosenIndex)
                }
                return
            }
            cardsOnTable[chosenIndex].selected = false
            if firstSelectedCard == chosenIndex {
                firstSelectedCard = nil
            } else if secondSelectedCard == chosenIndex {
                secondSelectedCard = nil
            }
        }
        
        func selectedCard(_ selectedCardIndex: Int) -> Int{
            cardsOnTable[selectedCardIndex].selected = true
            return selectedCardIndex
        }
    }
    
    // раскрытие карт после выдачи
    mutating func faceUpCard(_ card: Card){
        if let index = cardsOnTable.firstIndex(where: {$0.id == card.id}){
            cardsOnTable[index].startFaceUp = true
        }
        
    }
    
//    //проверка на оставшиеся сеты
//    private mutating func checkEndGame(){
//        if theDeck.count == 0{
//            for i in 0..<cardsOnTable.count{
//                if i != cardsOnTable.endIndex{
//                    if checkSet(i, (i+1), (i+2)) == true{
//                        
//                    }
//                } else { }
//            }
//        }
//    }
    
    // добавление трёх карт на поле
        
    mutating func addThreeCards(){
            if theDeck.count != 0{
                for _ in 1...3{
                    cardsOnTable.append(theDeck[0])
                    theDeck.remove(at: 0)
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
    
    // удаление совпавших карт из массива
    
    private mutating func deleteMatchedCards(){
        if cardsOnTable.count != 0{
            for _ in 0..<cardsOnTable.count{
                if let index = cardsOnTable.firstIndex(where: {$0.isMatched == true}){
                    cardsOnTable.remove(at: index)
                }
            }
        }
    }
    
    // проверка set
    
    private func checkSet(_ first: Int, _ second: Int, _ third: Int) -> Bool {
        if (checkColor()&&checkShapes()&&checkFilling()&&checkNumbers()){
            return true
        } else {
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

