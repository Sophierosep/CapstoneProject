//
//  Home.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 11/06/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu().tabItem{Label("Menu", systemImage:"list.dash")}
            UserProfile().tabItem{Label("Profile", systemImage: "sqaure.and.pencil")}
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
