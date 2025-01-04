//
//  AddressView.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 3/01/25.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                
                Section {
                    NavigationLink("Check out") {
                        CheckoutView(order: order)
                    }
                }
                
                .navigationTitle("Delivery Details")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
