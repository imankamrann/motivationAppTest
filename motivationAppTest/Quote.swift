//
//  Quote.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//

import Foundation

struct Quote: Codable, Identifiable {
    let id = UUID()
    let q: String
    let a: String
    
    enum CodingKeys: String, CodingKey {
        case q = "q"
        case a = "a"
    }
}
