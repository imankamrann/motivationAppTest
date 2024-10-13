//
//  ContentView.swift
//  motivationAppTest
//
//  Created by Iman on 2024-10-13.
//
import SwiftUI

struct ContentView: View {
    let quotes = [
        "The best way to get started is to quit talking and begin doing.",
        "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.",
        "Don’t let yesterday take up too much of today.",
        "You learn more from failure than from success. Don’t let it stop you. Failure builds character."
    ]
    
    var body: some View {
        ZStack {
            Color.blue // Set the entire background to blue
                .ignoresSafeArea() // Ensure it extends to safe areas

            TabView {
                ForEach(quotes, id: \.self) { quote in
                    QuoteCard(quote: quote)
                        .edgesIgnoringSafeArea(.all) // Ensure the content extends to cover the entire screen
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .rotationEffect(.degrees(90)) // Rotate the TabView to make it vertical
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

struct QuoteCard: View {
    let quote: String
    
    var body: some View {
        ZStack {
            Color.blue // Background color to match the app's background
            Text(quote)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
        .rotationEffect(.degrees(-90)) // Rotate the content back to its normal position
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure it fills the screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
