//
//  ContentView.swift
//  Books
//
//  Created by Venuka Valiveti on 19/04/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel:BooksViewModel
    var body: some View {
        ZStack{
            NavigationView{
               // List{
                ScrollView{
                    ForEach(viewModel.getResultData,id:\.uuId){bookItem in
                        BookDetails(viewModel: viewModel, item: bookItem)
                    }
                }
               
                //.listStyle(.automatic)
                .navigationTitle("Books")
                .refreshable {
                    viewModel.getData()
                }
            }
            if viewModel.isDescription{
                VStack{
                    DescriptionView(viewModel: viewModel, descriptionText: viewModel.descriptionValue)
                }
            }
        }
        .onAppear{
            viewModel.getData()
        }
        
    }
}

struct BookDetails:View{
    @StateObject var viewModel:BooksViewModel
    @State var item:GetBooksResultData
    @State var checkboxChecked:Bool = false
    @State var isPresented:Bool = false
    @State var isDescription:Bool = false
    @State var showImage:Bool = false
    var body: some View{
        VStack(alignment:.leading,spacing: 5){
            HStack(alignment:.top){
                Button {
                    checkboxChecked.toggle()
                    item.checkboxSelected = checkboxChecked
                } label: {
                    Image(systemName: checkboxChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 25,height: 25)
                }
                VStack(alignment:.leading,spacing: 5){
                    Text(item.volumeInfo?.title ?? "")
                        .font(.system(size: 14).bold())
                    Text(item.volumeInfo?.description ?? "")
                        .font(.system(size: 10))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if item.checkboxSelected ?? false{
                        isDescription.toggle()
                        item.showDescription = isDescription
                        viewModel.isDescription = isDescription
                        viewModel.descriptionValue = item.volumeInfo?.description ?? ""
                    }else{
                        isPresented.toggle()
                        item.isShowAlert = isPresented
                    }
                }
                .alert("Select checkbox to view description", isPresented: $isPresented) {
                    Button("OK", role: .cancel) { }
                }
                Spacer()
                if let url = URL(string: item.volumeInfo?.imageLinks?.smallThumbnail ?? ""){
                    Link(destination: url){
                        Image(systemName: "book.closed")
                            .resizable()
                            .frame(width:25,height: 25)
                    }
                }
            }
            Divider()
        }.padding([.leading,.trailing],10)
    }
}

struct DescriptionView:View{
    @StateObject var viewModel:BooksViewModel
    @State var descriptionText:String
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .opacity(0.5)
            VStack{
                Spacer()
                HStack{
                    VStack(alignment:.leading){
                        Text(descriptionText)
                            .font(.system(size: 14).bold())
                    }.padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
                .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(1.0)))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.black,lineWidth: 0.3))
                Spacer()
                HStack{
                    Button(action: {
                        withAnimation(.easeOut){
                            viewModel.isDescription = false
                        }
                    }, label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width:25,height: 25)
                    })
                }.padding(.bottom,70)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
