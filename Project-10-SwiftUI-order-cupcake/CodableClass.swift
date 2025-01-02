//
//  CodableClass.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 2/01/25.
//

import SwiftUI

@Observable
class User: Codable {
    var name = "Taylor"
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}

struct CodableClass: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        
        let newData = try! JSONDecoder().decode(User.self, from: data)
        print(newData.name)
    }
}

#Preview {
    CodableClass()
}
