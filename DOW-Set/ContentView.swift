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
        AspectVGrid(items: viewModel.cardOnTable, aspectRatio: 2/3){card in
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
    - невозможно сделать последнее добавление карт: Preview crash/index out of
 range
    - не выходит выбрать и убрать выбор с карты - она остаётся в памяти и
 происходит проверка на сет
    - решить переход на ScrolView, когда количество карт на столе = 19, так как чем больше карт
 тем меньше становятся -> невозможно разглядеть элементы карт
    - иногда попадаются одинаковые карты (???)
    - решить начало новый игры
    - даже если 12 карт на столе, View меняется так, будто на столе более 12 карт(!)
*/
