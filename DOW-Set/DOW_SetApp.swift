//
//  DOW_SetApp.swift
//  DOW-Set
//
//  Created by Денис Никитин on 10.07.2024.
//

import SwiftUI

@main
struct DOW_SetApp: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
