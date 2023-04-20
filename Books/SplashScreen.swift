//
//  SplashScreen.swift
//  Books
//
//  Created by Venuka Valiveti on 19/04/23.
//

import Foundation
import SwiftUI

struct SplashScreen:View{
    @StateObject var viewModel:BooksViewModel
    @State var isActive = false
    @State var size = 8.5
    var body: some View{
        ZStack{
            if isActive{
                ContentView(viewModel: viewModel)
            }else{
                VStack{
                    VStack{
                        Image(systemName: "book.circle.fill")
                    }
                    .scaleEffect(size)
                    .foregroundColor(.blue)
                    .onAppear{
                        withAnimation(.easeIn(duration: 5.0)){
                            self.size = 9.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}
