//
//  ViewModel.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 04.07.2024.
//

import SwiftUI

class ViewModel: ObservableObject{
    @Published private var model = DOWSetGameModel()
    
    var theDeck: Array<DOWSetGameModel.Card>{
        return model.theDeck
    }
    
    var cardOnTable: Array<DOWSetGameModel.Card>
    {
        return model.cardsOnTable
    }
    
    func add(){
        model.addThreeCards()
    }
    
    func choose(card: DOWSetGameModel.Card){
        model.choose(card)
    }

}
