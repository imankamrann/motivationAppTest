import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Set the background image
                Image("backgroundImg2") // Replace with your image name
                // illusration by https://annamachtart.tumblr.com
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer() // Pushes the content down

                    // Welcome Text
//                    Text("Motivation App")
//                        .font(.custom("CormorantGaramond-BoldItalic", size: 55))
//                        .foregroundColor(Color(red: 217/255, green: 213/255, blue: 207/255))
//                        .padding(10)

                    HStack {
                        Spacer() // Pushes the button to the right

                        // Navigation Link Button
                        NavigationLink(destination: ContentView()) {
                            Text("→")
                                .font(.title) // Smaller font size for a smaller button
                                .frame(width: 75, height: 75) // Adjust size for a smaller button
                                .background(Color(red: 217/255, green: 213/255, blue: 207/255)) // Background color for the button
                                .foregroundColor(Color(red: 73/255, green: 76/255, blue: 79/255)) // Text color
                                .clipShape(Circle()) // Makes the button a circle
                                .shadow(radius: 5) // Optional shadow for better visibility
                        }
                        .padding(.trailing, 26) // Add some padding from the right edge
                    }
                    .padding(.bottom, 40) // Additional padding to move the button lower
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
