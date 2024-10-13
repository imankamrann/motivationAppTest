//
//  QuoteViewModel.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//

import Foundation
import Combine

class QuoteViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchQuotes()
    }
    
    func fetchQuotes() {
        guard let url = URL(string: "https://zenquotes.io/api/quotes") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Quote].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.quotes, on: self)
            .store(in: &cancellables)
    }
}
