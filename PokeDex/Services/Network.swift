//
//  Network.swift
//  PokeDex
//
//  Created by Andre Luis Barbosa Coutinho on 28/05/21.
//

import Foundation

class Network {
    
    func get<T:Decodable>(from url: String, resultType: T.Type, completion:@escaping(_ result: T?)-> Void){
        // Prepare URL Request Object
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) {(responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                guard let responseData = responseData?.parseData(removeString: "null,") else { return }
                if let response = try? JSONDecoder().decode(T.self, from: responseData)
                {
                    _=completion(response)
                }
                else{
                    print("Requisição não é \(T.self)")
                }
            }
            else{
                print(error!)
            }
        }.resume()
    }
    
}

extension Data {
    func parseData(removeString string: String) ->Data? {
        let dataAsString = String(data:self, encoding: .utf8)
        let parsedDataString  = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data;
    }
}
