//
//  QuotesModel.swift
//  Quotes
//
//  Created by Катя on 07.10.2024.
//

import Foundation

struct QuotesModel: Decodable {
    var quotes: [QuotesData]
}
struct QuotesData: Decodable {
    var quote: String
    var author: String
    var category: String
}
