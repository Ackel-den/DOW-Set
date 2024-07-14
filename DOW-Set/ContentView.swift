//
//  ContentView.swift
//  DOW(Set Game)

//  D - Diamonds
//  O - Ovals
//  W - Waves

//  Created by Денис Никитин on 02.07.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        AspectVGrid(items: viewModel.cardOnTable, aspectRatio: 2/3, numberOfCards: viewModel.cardOnTable.count){card in
            if !card.isMatched{
                cardView(for: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        HStack(){
            if !viewModel.theDeck.isEmpty{
                AddButton().onTapGesture {
                    viewModel.add()
                }
            }
                TheDeck(number: viewModel.theDeck.count)
        }
    }
    @ViewBuilder
    private func cardView(for card: DOWSetGameModel.Card) -> some View{
        CardView(content: card)
    }

}

#Preview {
    let game = ViewModel()
    return ContentView(viewModel: game)
}


/* БАГИ И НЕРЕШЁННЫЕ ЗАДАЧИ:
    - не выходит выбрать и убрать выбор с карты - она остаётся в памяти и
 происходит проверка на сет
    - иногда попадаются одинаковые карты (???)
    - решить начало новый игры
*/
