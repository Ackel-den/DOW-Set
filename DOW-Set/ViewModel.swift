//
//  ViewModel.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 04.07.2024.
//

import SwiftUI

class ViewModel: ObservableObject{
    typealias Card = DOWSetGameModel.Card
    
    @Published private (set) var model = DOWSetGameModel()
    
    var cardsOnTable: Array<DOWSetGameModel.Card>{
        model.cardsOnTable
    }
    
    var gameStart: Bool{
        return model.gameStart
    }
    
    var theDeck: Array<DOWSetGameModel.Card>{
        return model.theDeck
    }

    
    func add(){
        model.addThreeCards()
    }
    func gameStarted(){
        model.changeStartGame()
    }
    func choose(card: DOWSetGameModel.Card){
        model.choose(card)
    }
    func restart(){
        model = DOWSetGameModel()
    }
    func changeFaceUp(_ card: Card){
        model.faceUpCard(card)
    }
}
