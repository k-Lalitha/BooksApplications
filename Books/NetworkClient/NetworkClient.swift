//
//  NetworkClient.swift
//  Books
//
//  Created by Venuka Valiveti on 20/04/23.
//

import Foundation
//
//  NetworkClient.swift
//  SearchBook
//
//  Created by lalitha korlapu on 17/02/23.
//

import Foundation
class NetworkClient {
    static let shared = NetworkClient()
    static var  BASEURL : String = "https://www.googleapis.com/"
        
        func getJsonDataWith(endPoint : String,parameters : [String : String]?,completion : @escaping(_ jsonData : Data) -> Void){
            var allowedQueryParamAndKey =  CharacterSet.urlQueryAllowed
            allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$")
            let encodedEndPoint = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            var request = URLRequest(url: URL(string: NetworkClient.BASEURL + encodedEndPoint)!)
            request.setValue("application/json", forHTTPHeaderField: "ContentType")
            if(parameters?.count != nil){
                for param in parameters ?? [:] {
                    request.setValue(param.value , forHTTPHeaderField: param.key)
                }
            }
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                        if error != nil {
                           // CLog.infoWith(TAG: "", msg: error?.localizedDescription as Any)
                        } else {
                            if let receivedResponse = response as? HTTPURLResponse {
                            }
                            else{
                               
                            }
                        }
                        return
                } //GuardLet endBrace
                if let genaricResponseModel = try? JSONDecoder().decode(GenaricResponseModel.self, from: data) {
                    if genaricResponseModel.resultCode != 0 {
                        completion(data)
                    }
                    else {
                        completion(data)
                    }
                } //If let endBrace
                else {
                    completion(data)
                }
            }
            task.resume()
            }
    
    
    func getGenericServiceCall<T : Codable>(endPoint:String,logInfo:String = "",parameters:[String:String]?,success successBlock:@escaping(Swift.Result<T,Error>)->()) {
        NetworkClient().getJsonDataWith(endPoint: endPoint, parameters: parameters) { jsonData in
            do {
                let jsonDecoder = try JSONDecoder().decode(T.self, from: jsonData)
                successBlock(.success(jsonDecoder))
            }
            catch let error{
                successBlock(.failure(error))
            }
        }
    }
}
