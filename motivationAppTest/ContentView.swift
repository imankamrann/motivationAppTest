//
//  ContentView.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//
//import SwiftUI

// API 1
//struct ContentView: View {
//    @StateObject private var viewModel = QuoteViewModel()
//    
//    var body: some View {
//        ZStack {
//            Color.blue
//                .ignoresSafeArea()
//            
//            TabView {
//                ForEach(viewModel.quotes) { quote in
//                    QuoteCard(quote: quote.q, author: quote.a)
//                        .edgesIgnoringSafeArea(.all)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .rotationEffect(.degrees(90))
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        }
//    }
//}
//
//struct QuoteCard: View {
//    let quote: String
//    let author: String
//    
//    var body: some View {
//        ZStack {
//            Color.blue
//            VStack {
//                Text(quote)
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                Text("- \(author)")
//                    .font(.title2)
//                    .foregroundColor(.white)
//            }
//            .rotationEffect(.degrees(-90))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


// API 2 - horizontal swiping
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            TabView {
                ForEach(viewModel.quotes) { quote in
                    QuoteCard(quote: quote.quote, author: quote.author)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.5) // Adjusted size
                        .onAppear {
                            // Fetch new quotes when this quote card appears
                            viewModel.fetchQuotes()
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Use PageTabViewStyle for vertical swiping
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // Full height and width for the TabView
        }
    }
}

struct QuoteCard: View {
    let quote: String
    let author: String
    
    var body: some View {
        ZStack {
            Color.blue
                .cornerRadius(10) // Rounded corners for the card
                .shadow(radius: 5) // Add a shadow for a card effect
            VStack {
                Text(quote)
                    .font(.system(size: 24)) // Adjust the font size as needed
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil) // Allow the text to use as many lines as needed
                    .padding()
                
                Text("- \(author)")
                    .font(.title3) // Adjust font size for the author
                    .foregroundColor(.white)
                    .padding(.top, 10) // Add some space between quote and author
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure it fills the width, but not the height
            .padding() // Add padding to the card content
        }
        .frame(maxWidth: .infinity) // Ensure the card fills the width
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


