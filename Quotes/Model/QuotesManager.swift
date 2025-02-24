//
//  QuotesManager.swift
//  Quotes
//
//  Created by Катя on 07.10.2024.
//

import Foundation
import SnapKit


struct QuotesManager {
    
    func getCategoryQuotes(completionHandler:@escaping (_ response: [QuotesData])->Void ) {
 
       
        
//        let category = categoryArray.randomElement()!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/quotes")!
        var request = URLRequest(url: url)
        request.setValue("YM6sTKqXUZvbwMtS5jCJhA==v7KJDg6AnKaUcH8P", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode([QuotesData].self, from: data)
                print(result)
                completionHandler(result)
            } catch {
                print("Failed to convert JSON\(error)")
            }
        }
        task.resume()
    }
}
