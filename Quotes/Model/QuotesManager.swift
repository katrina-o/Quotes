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
        
        
        let categoryArray = ["happiness", "age", "alone", "dreams", "food"]
        
        let category = categoryArray.randomElement()!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category="+category!)!
        var request = URLRequest(url: url)
        request.setValue("YM6sTKqXUZvbwMtS5jCJhA==v7KJDg6AnKaUcH8P", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
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
