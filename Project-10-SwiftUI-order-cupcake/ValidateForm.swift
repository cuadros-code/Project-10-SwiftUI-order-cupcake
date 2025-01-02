//
//  ValidateForm.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 2/01/25.
//

import SwiftUI

struct ValidateForm: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
//            .disabled(username.isEmpty || email.isEmpty)
        }    }
}

#Preview {
    ValidateForm()
}
