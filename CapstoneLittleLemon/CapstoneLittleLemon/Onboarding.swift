//
//  Onboarding.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 10/06/2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""
    var body: some View {
        VStack{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email",text: $email)
            Button("Register", action:{
                if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty){
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                }
                else{}
                    
            }
            )
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
