//
//  BooksViewModel.swift
//  Books
//
//  Created by Venuka Valiveti on 19/04/23.
//

import Foundation

class BooksViewModel:ObservableObject{
    @Published var getResultData:[GetBooksResultData] = []
    @Published var isDescription:Bool = false
    @Published var descriptionValue:String = ""
    @Published var showImg:Bool = false
    
    func getData(){
        let searchText = "Harry potter"
        NetworkClient().getGenericServiceCall(endPoint: "books/v1/volumes?q=\(searchText)", logInfo: "Get Books Items", parameters: nil) { (result: Swift.Result<GetBooksData, Error>) in
            switch result{
            case .success(let bookItems):
                DispatchQueue.main.async {
                    self.getResultData = bookItems.items ?? []
                }
            case .failure(let error):
                print(error)
            }
        }
    
//        task.resume()
    }
}
