//
//  QuoteViewModel.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//

import Foundation
import Combine

// API 1
//class QuoteViewModel: ObservableObject {
//    @Published var quotes: [Quote] = []
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        fetchQuotes()
//    }
//    
//    func fetchQuotes() {
//        guard let url = URL(string: "https://zenquotes.io/api/quotes") else { return }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: [Quote].self, decoder: JSONDecoder())
//            .replaceError(with: [])
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.quotes, on: self)
//            .store(in: &cancellables)
//    }
//}

// API 2

import Foundation
import Combine

class QuoteViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchQuotes()
    }
    
    func fetchQuotes() {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=happiness") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("lnrKk/a+Zrd7/Yr2lOpC0Q==GuwliNa6EAj3Ldgd", forHTTPHeaderField: "X-Api-Key") // Add your API key here
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Quote].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { newQuotes in
                // Only keep the new quote if the array is empty, otherwise append
                if newQuotes.isEmpty {
                    return
                }
                self.quotes.append(newQuotes[0]) // Add the first quote from the new response
            })
            .store(in: &cancellables)
    }
}

