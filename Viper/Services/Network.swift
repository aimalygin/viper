//
//  Network.swift
//  Viper
//
//  Created by Антон Малыгин on 24/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation

struct Response: Codable {
    let text: [String]
    let code: Int
}

protocol NetworkServiceProtocol {
    func translate(request: TranslationRequest, completion: @escaping (String?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    private let apiKey = "trnsl.1.1.20190724T201953Z.dda102e7c3a75c27.4dfd8bdf6aefb5d53237f37bb0b5c8b1ac7d0d7d"
    
    func translate(request: TranslationRequest, completion: @escaping (String?) -> Void) {
        let urlString = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=\(apiKey)&text=\(request.word)&lang=\(request.to)"
        guard let encodingString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encodingString) else {
                
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let translationResponse = try decoder.decode(Response.self, from: data)
                if translationResponse.code == 200 {
                    completion(translationResponse.text.first)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
