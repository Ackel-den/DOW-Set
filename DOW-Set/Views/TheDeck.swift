//
//  TheDeck.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 08.07.2024.
//

import SwiftUI

struct TheDeck: View {
    var rectangle = RoundedRectangle(cornerRadius: 25.0)
    var number: Int
    var body: some View {
        ZStack{
            rectangle
                .frame(width: 100, height: 150)
                .foregroundColor(.orange)
            Text("Card in deck: \n \(number)").foregroundColor(.white).multilineTextAlignment(.center)
        }
    }
}


