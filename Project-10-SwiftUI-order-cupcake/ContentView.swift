//
//  ContentView.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 23/12/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: String
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .task(priority: .userInitiated) {
            await loadData()
        }
    }
    
    func loadData() async {
        
    }
    
}

#Preview {
    ContentView()
}
