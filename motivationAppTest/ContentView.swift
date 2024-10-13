//
//  ContentView.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            TabView {
                ForEach(viewModel.quotes) { quote in
                    QuoteCard(quote: quote.q, author: quote.a)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .rotationEffect(.degrees(90))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

struct QuoteCard: View {
    let quote: String
    let author: String
    
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text(quote)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("- \(author)")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .rotationEffect(.degrees(-90))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
