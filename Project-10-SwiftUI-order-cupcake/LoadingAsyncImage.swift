//
//  LoadingAsyncImage.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 2/01/25.
//
import SwiftUI

struct LoadingAsyncImage: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Text("Loading...")
        }
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    LoadingAsyncImage()
}
