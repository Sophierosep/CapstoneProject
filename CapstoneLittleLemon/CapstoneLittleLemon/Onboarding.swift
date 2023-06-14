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
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""
    @State var isLoggedIn = false
    var body: some View {
        NavigationView{
            VStack{
                Image("Logo").frame(width:50,height:50)
                VStack{
                    Text("Little Lemon")
                        .font(.custom("Georgia", size: 40))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundColor(Color("yellow"))
                    Text("Chicago")
                        .font(.custom("Georgia", size: 32))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.regular)
                        .foregroundColor(Color("grey"))
                    HStack{
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.custom("Georgia", size: 18))
                                .frame(maxWidth: .infinity, maxHeight:130, alignment: .leading)
                                .fontWeight(.regular)
                                .foregroundColor(Color("grey"))
                        Image("Hero image")
                            .resizable()
                            .frame(width: 100,height: 120)
                            .cornerRadius(8)
                    }.padding(0)
                }.padding(10)
                    .background(Color("green"))
                
                VStack{
                    NavigationLink(destination: Home(),  isActive: $isLoggedIn) { EmptyView()}
                    Text("First Name *")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)

                    Text("Last Name *")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)

                    Text("Email * ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("Email",text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.gray)

                    
                    Button("Register", action:{
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        }
                        else{
                            
                        }
                    }
                    )
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding([.bottom, .top],8)
                    .padding([.leading, .trailing],8)
                    .background(Color("grey"))
                    .cornerRadius(16)
                    .padding(5)
                    Spacer()
                }.padding(10)

            }.onAppear{if ( UserDefaults.standard.bool(forKey: "kIsLoggedIn")){isLoggedIn=true}}
        }

    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
