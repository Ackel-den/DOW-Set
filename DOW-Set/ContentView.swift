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
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                table
                Spacer()
                if dealt.count > 0 && !viewModel.gameStart{
                    startButton
                }
                HStack{
                    deckBody
                    VStack{
                        if viewModel.gameStart{
                            dealCardButton
                                .padding(.bottom)
                            restartButton
                        }
                    }
                }
            }
        }
    }

    @State var dealt = Set<Int>()
    
    private func deal(_ card: ViewModel.Card){
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: ViewModel.Card) -> Bool{
        !dealt.contains(card.id)
    }
    
    var dealCardButton: some View{
        Button("Deal 3 cards"){
            viewModel.add()
        }
    }
    
    var restartButton: some View{
        Button("Restart"){
            dealt = []
            viewModel.restart()
        }
    }
    
    var startButton: some View {
        Button("Let's start!"){
            viewModel.gameStarted()
        }
    }
    
    var deckBody: some View{
        ZStack{
            ForEach(viewModel.cardsOnTable.filter(isUndealt)){ card in
                CardView(content: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .onTapGesture {
                for card in viewModel.cardsOnTable{
                    withAnimation(dealAnimation(for: card)){
                        deal(card)
                        if viewModel.gameStart{
                            viewModel.changeFaceUp(card)
                        }
                }
            }
        }
    }
    
    var table: some View{
        AspectVGrid(items: viewModel.cardsOnTable, aspectRatio: CardConstants.aspectRatio, numberOfCards: viewModel.cardsOnTable.count){card in
            if isUndealt(card){
                Color.clear
            } else {
                if !card.isMatched{
                    CardView(content: card)
                        .padding(3)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .onTapGesture{
                            viewModel.choose(card: card)
                        }
                }
            }
        }
    }
    
    private func dealAnimation(for card: ViewModel.Card) -> Animation{
        var delay = 0.0
        if let index = viewModel.cardsOnTable.firstIndex(where: {$0.id == card.id}){
            delay = Double(index) * CardConstants.totalDealDuration / Double(viewModel.cardsOnTable.count)
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration)
            .delay(delay)
    }
}


private struct DrawingConstants{
    static let fontScale: CGFloat = 0.7
    static let fontSize: CGFloat = 32
}

private struct CardConstants{
    static let aspectRatio: CGFloat = 2/3
    static let color = Color.red
    static let dealDuration: Double = 0.5
    static let totalDealDuration: Double = 2
    static let undealtHeight: CGFloat = 90
    static let undealtWidth = undealtHeight * aspectRatio
}


#Preview {
    let game = ViewModel()
    return ContentView(viewModel: game)
}


/* БАГИ И НЕРЕШЁННЫЕ ЗАДАЧИ:
    - не выходит выбрать и убрать выбор с карты - она остаётся в памяти и
 происходит проверка на сет
    - иногда попадаются одинаковые карты (???)
    - сделать 3D переворот карт в начале игры - ???
    - сделать проверку на окончание игры - есть ли ещё сеты на столе
    - сделать дрожание карт, если не совпали
 */
