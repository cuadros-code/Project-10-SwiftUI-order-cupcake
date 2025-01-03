//
//  FetchDataInternet.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 2/01/25.
//

import SwiftUI

struct Response: Codable {
    var resultCount: Int
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct FetchDataInternet: View {
    
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
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(
                Response.self,
                from: data
            ) {
                results = decodedResponse.results
            } else {
                print("Not found data")
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

#Preview {
    FetchDataInternet()
}
