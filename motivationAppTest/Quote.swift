//
//  Quote.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//

import Foundation

// API 1

//struct Quote: Codable, Identifiable {
//    let id = UUID()
//    let q: String
//    let a: String
//    
//    enum CodingKeys: String, CodingKey {
//        case q = "q"
//        case a = "a"
//    }
//}


// API 2

struct Quote: Codable, Identifiable {
    let id = UUID() // To conform to Identifiable protocol
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "quote"
        case author = "author"
    }
}
