//
//  BooksApp.swift
//  Books
//
//  Created by Venuka Valiveti on 19/04/23.
//

import SwiftUI

@main
struct BooksApp: App {
    @StateObject var viewModel = BooksViewModel()
    var body: some Scene {
        WindowGroup {
            //ContentView(viewModel: viewModel)
            SplashScreen(viewModel: viewModel)
        }
    }
}
