//
//  AddButton.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 08.07.2024.
//

import SwiftUI

struct AddButton: View {
    var rectangle = RoundedRectangle(cornerRadius: 40)
        .strokeBorder(lineWidth: 5)
    var body: some View {
        ZStack{
            rectangle.frame(width: 160, height: 80)
            Text("Add 3 cards")
                .font(.title)
        }
    }
}

#Preview {
    AddButton()
}
