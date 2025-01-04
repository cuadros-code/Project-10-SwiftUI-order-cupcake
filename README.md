#  Project 10

- async / await
- .task
- AsyncImage
- .sensoryFeedback
- CHHapticEngine
- import CoreHaptics
- Task

### Load Image 
```swift
AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)


AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { image in
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
```

---
## Force Encode properties
```swift 
@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}
```
