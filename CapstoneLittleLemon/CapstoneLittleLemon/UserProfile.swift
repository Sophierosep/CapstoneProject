//
//  UserProfile.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 11/06/2023.
//

import SwiftUI

let firstName = UserDefaults.standard.string(forKey: kFirstName)
let lastName = UserDefaults.standard.string(forKey: kLastName)
let email = UserDefaults.standard.string(forKey: kEmail)

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
            Text(firstName ?? "firstName")
            Text(lastName ?? "lastName")
            Text(email ?? "email")
            Button("Logout", action:{UserDefaults.standard.set(false, forKey: "kIsLoggedIn"); self.presentation.wrappedValue.dismiss()})
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
